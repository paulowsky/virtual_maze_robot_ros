#!/usr/bin/env python3

import random
import time

import numpy as np
import actionlib
import rospy
import cv2

from collections import defaultdict
from enum import Enum

from cv_bridge import CvBridge

from work_smaart.srv import *
from geometry_msgs.msg import Point
from sensor_msgs.msg import CompressedImage
from work_smaart.srv import *
from work_smaart.msg import goalPositionAction, goalPositionFeedback, goalPositionResult, goalPositionGoal


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

VERBOSE=rospy.get_param('~verbose',False)

DIRECTION_CONVERT = ['N', 'S', 'E', 'W']
DIRECTION_CHANGE = {'N':(0, -1), 'E':(1, 0), 'S':(0, 1), 'W':(-1, 0)}
DIRECTION_INVERT = {'N':'S', 'S':'N', 'E':'W', 'W':'E'}
DIRECTION_INDEX = {'N':0, 'E':1, 'S':2, 'W':3}
DIRECTION_AXIX = ['N','E','S','W']

get_direction = lambda current, jump: DIRECTION_AXIX[(DIRECTION_INDEX[current]+jump) % 4]
change_coordenate = lambda x, y, direction: (x+DIRECTION_CHANGE[direction][0], y+DIRECTION_CHANGE[direction][1])

_cvb = CvBridge()
imgBase = cv2.imread("/root/catkin_ws/src/work_smaart/src/base.jpg")

class Moviment(Enum):
    left = 0
    walk = 1
    right = 2

def img_is_hall(img):
    imgTest = _cvb.compressed_imgmsg_to_cv2(img)

    if imgBase is None or imgTest is None:
        print("could not read the images")
        return
    
    hsv_base = cv2.cvtColor(imgBase, cv2.COLOR_BGR2HSV)
    hsv_test = cv2.cvtColor(imgTest, cv2.COLOR_BGR2HSV)
    
    hsv_half_down = hsv_base[hsv_base.shape[0]//2:,:]
    
    hue_bins=50
    saturation_bins=60
    histSize = [hue_bins, saturation_bins]
    
    #hue varia entre 0~179, saturação entre 0~255
    h_ranges = [0,180]
    s_ranges=[0,256]
    ranges=h_ranges + s_ranges # concatenando as lista
    
    #usar os canais 0 e 1
    channels= [0,1]
    
    hist_base = cv2.calcHist([hsv_base], channels, None, histSize, ranges, accumulate=False)
    cv2.normalize(hist_base, hist_base, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX)

    hist_half_down = cv2.calcHist([hsv_half_down], channels, None, histSize, ranges, accumulate=False)
    cv2.normalize(hist_half_down, hist_half_down, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX)

    hist_test = cv2.calcHist([hsv_test], channels, None, histSize, ranges, accumulate=False)
    cv2.normalize(hist_test, hist_test, alpha=0, beta=1, norm_type=cv2.NORM_MINMAX)

    acurracia = cv2.compareHist(hist_base, hist_test, 0)
    return acurracia  > 0.5

class Node:
    def __init__(self, face, x, y, root = None):

        self.face = face
        self.x = x
        self.y = y
        self.face_root = None

        self.faces = {'N':None, 'S':None, 'E':None, 'W':None}

        if(root):        
            self.face_root = DIRECTION_INVERT[face]    
            self.faces[self.face_root] = root

    def get_face(self, face):
        return  self.faces[face]
    
    def set_face(self, face, node):
        print("set node", face)
        self.faces[face] = node
    
    def set_wall(self, face):
        print("set wall in", face)
        self.faces[face] = "wall"

    def is_wall(self, face):        
        return self.faces[face] == "wall"
    
    @property
    def node_root(self):
        return self.faces[self.face_root ]
    
    def is_leaf(self):
        is_leaf = True
        for face, node in self.faces.items():
            if(face == self.face_root):
                continue
            if(node!="wall"):
                is_leaf = False
                break
        return is_leaf

    def get_coordenate(self):
        return (self.x,self.y)
    
    def __repr__(self):
        return f"Node({self.face}, {self.x}, {self.y})"

class Subject:
    def __init__(self):        
        self._actionServer = actionlib.SimpleActionServer("mover_robot", goalPositionAction, self.onGoal, False)
        self.is_end= False

        self.target_point = None

        self.current_node = None
        self.current_face = None

        self.last_moviment = None
        self.moviments = 0
        self.distance = 0

        self.battery_low = False
        self.restore_map = []

    def start(self):
        self._actionServer.start()

    def _back_root(self):
        self.current_node = self.current_node.node_root
        self.current_node.set_wall(DIRECTION_INVERT[self.current_face])
        self.distance -= 1

        self.send_moviment(Moviment.walk)    
    
    def _back_battery_low(self):

        self.restore_map.append(self.current_node.face)
        self.current_node = self.current_node.node_root

        self.send_moviment(Moviment.walk)

    def _back_restore(self):
        face = self.restore_map.pop()
        self.current_node = self.current_node.get_face(face)
        self.send_moviment(Moviment.walk)
        self.distance += 1
    
    
    def _walk_forward(self):
        root_face = DIRECTION_INVERT[self.current_face]

        x, y = change_coordenate(*self.current_node.get_coordenate(), self.current_face)
        new_node =  Node(self.current_face, x, y, root=self.current_node)
        
        self.current_node.set_face(self.current_face, new_node)
        self.current_node = new_node
        self.distance += 1

        self.send_moviment(Moviment.walk)

    def _turn_to(self, face):
        print("_turn_to:", face)
        if(face == "new"):
            left_node = self.current_node.get_face(get_direction(self.current_face, -1))
            right_node = self.current_node.get_face(get_direction(self.current_face, 1))

            if(left_node != None):
                distance = 3
            elif(right_node != None):
                distance = 1
            else:
                distance = random.choice([1, 3])

        else:
            distance = (DIRECTION_INDEX[self.current_face] - DIRECTION_INDEX[face]) % 4

        if(distance == 2):
            distance  = random.choice([1, 3])
        
        if(distance == 1 or distance == 0):
            self.current_face = get_direction(self.current_face, -1)
            self.send_moviment(Moviment.left)

        elif(distance == 3):
            self.current_face = get_direction(self.current_face, 1)
            self.send_moviment(Moviment.right)            
            
    
    def _check_battery_low(self):             
        try:
            servicoCalling = rospy.ServiceProxy('battery_service', BatCalc)  
            responseFromBattery = servicoCalling(self.distance, self.moviments)
            return responseFromBattery.isWeak
        except rospy.ServiceException as e:
            print("erro no serviço, man:",e)
            return False
        

    def send_moviment(self, moviment: Moviment):

        if(moviment == Moviment.walk):
            self.moviments +=1

        _feedback = goalPositionFeedback()
        _feedback.NextMoveDirection = moviment.value
        self.last_moviment = moviment
        self._actionServer.publish_feedback(_feedback)
        

    def imgCallback(self, response_images):        
        print("Recebi uma imagem!")  
        print("current node", self.current_node)  
        print("distancia", self.distance)
        print("moviments", self.moviments)
        print("target", self.target_point)

        if(self.last_moviment == Moviment.walk and not self.battery_low):
            self.battery_low = self._check_battery_low()

        if(self.current_node.get_coordenate() == (0, 0)):
            self.moviments = 0
            self.distance = 0
            self.battery_low = False

        if(self.current_node.get_coordenate() == self.target_point):
            self.is_end = True
            print("CHEGOU NO FINAl")
        
        elif(self.battery_low):
            print(f"{bcolors.OKGREEN}MODE: {bcolors.WARNING} battery low {bcolors.ENDC}")
            if(self.current_face == self.current_node.face_root):
                self._back_battery_low()
            else:
                self._turn_to(self.current_node.face_root)
        
        elif(self.restore_map):
            print(f"{bcolors.OKGREEN}MODE:{bcolors.ENDC} restore")
            face_restore = self.restore_map[-1]
            if(self.current_face == face_restore):
                self._back_restore()
            else:
                self._turn_to(face_restore)

        elif(self.current_node.is_leaf()):
            print(f"{bcolors.OKGREEN}MODE:{bcolors.ENDC} back")   
            if(self.current_face == self.current_node.face_root):
                self._back_root()
            else:
                self._turn_to(self.current_node.face_root)

        #Verifica se ele já gravou que a face é uma parede 
        elif(self.current_node.is_wall(self.current_face)):
            print(f"{bcolors.OKGREEN}MODE:{bcolors.ENDC} turn to")  
            self._turn_to("new")
        else:        
            print(f"{bcolors.OKGREEN}MODE:{bcolors.ENDC} new face")            
            is_hall = img_is_hall(response_images)

            if(is_hall):                
                if(self.current_face == self.current_node.face_root):
                    self._turn_to("new")
                else:
                    self._walk_forward()
            else:
                self.current_node.set_wall(self.current_face)
                self._turn_to("new")

    def onGoal(self, goal):
        print("GOAL!")
        self.target_point = (int(goal.EndOfBoard.x), int(goal.EndOfBoard.y)) 

        x = int(goal.StartOfBoard.x)
        y = int(goal.StartOfBoard.y)
        self.current_face = DIRECTION_CONVERT[int(goal.StartOfBoard.z)]

        root_face = DIRECTION_INVERT[self.current_face]
        self.current_node = Node("initial", x, y) 

        rospy.Subscriber('camera/image/compressed', CompressedImage, self.imgCallback, queue_size=10)
        r = rospy.Rate(10)
        r.sleep()
        self._turn_to("new")
        while not self.is_end:
             r.sleep()
        self._actionServer.set_succeeded(goalPositionResult()) 


class Cerebro():
    _feedback = goalPositionFeedback()
    _currentPosition = Point()

    def __init__(self):
        self.img = None        
        self.subject = Subject()
        
        if VERBOSE :
            print("subscribed to camera/image/compressed")

        self.subject.start()
 


def main(args=None):
    rospy.init_node('cerebro')
    rospy.wait_for_service('battery_service') 
    cerebro = Cerebro()
    try:
        
        # retorno = cerebro.batteryClient()
        # if retorno is True: 
        #     rospy.loginfo(f"tá consumindo o serviço certo: {retorno}")
        rospy.spin()
    except KeyboardInterrupt:
        print("shutting down Cerebro module")
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()


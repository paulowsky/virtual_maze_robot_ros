#!/usr/bin/env python3


import rospy
import actionlib
from geometry_msgs.msg import Point
from work_smaart.msg import goalPositionGoal, goalPositionAction, goalPositionFeedback, goalPositionResult

import socket
import pickle
import os

HOST = os.environ['MAZE_HOST']  # The server's hostname or IP address
PORT = int(os.environ['MAZE_PORT']) 

DIRECTION = {'N':0, 'S':1, 'E':2, 'W':3}


class Movement():
    def __init__(self):
        print("start moviment")
        self.client = actionlib.SimpleActionClient('mover_robot', goalPositionAction )

        print("wait for server")
        self.client.wait_for_server()

        print("wait for socket")
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.connect((HOST, PORT))
        self.socket.recv(255)
        self.socket.sendall(b"motor")

        print(self.socket.recv(255))
        (x_i, y_i, d), (x_f, y_f) = pickle.loads(self.socket.recv(255))
        
        ponto_inicial = Point(x_i, y_i, DIRECTION[d])
        ponto_final = Point(x_f, y_f, 0)

        print("start point:", ponto_inicial)
        print("end point:", ponto_final)

        _goal = goalPositionGoal(ponto_final, ponto_inicial)

        self.client.send_goal(_goal, self.doneCb, self.activeCb, self.feedbackCb)

        self.client.wait_for_result()

        _resultado = self.client.get_result()
        print("Result: "+str(_resultado))

    def doneCb (self,state, result):
        print("estado final:"+str(state))
        print("resultado: "+ str(result))

    def activeCb (self):
        print("Objetivo ativado")

    def feedbackCb(self, feedback):
        movimento = ""
        if(feedback.NextMoveDirection==0):
            movimento = "left"
        elif(feedback.NextMoveDirection==1):
            movimento = "walk"
        elif(feedback.NextMoveDirection==2):
            movimento = "right"

        self.socket.sendall(movimento.encode())
        movimentado = pickle.loads(self.socket.recv(255))

        print("feedback recebido, movimentar para:", movimento)
        print("atual:", movimentado)




# class Movement():

#     _resultado = goalPositionResult()
    

#     def __init__(self):
        
#         self.client = actionlib.SimpleActionClient('mover_robot', goalPositionAction )
#         self.client.wait_for_server()

#         self._pontoFinal = Point()
#         # self._pontoFinal.x = rospy.get_param('~entradaGoalX',20)
#         # self._pontoFinal.y = rospy.get_param('~entradaGoalY',20)
#         rospy.loginfo("ponto final, passando por aqui (loginfo)")
#         print("ponto final, passando por aqui (print)")
#         self._goal = goalPositionGoal(self._pontoFinal)
        
#         self.client.send_goal(self._goal, self.doneCb,self.activeCb, self.feedbackCb)

#         self.client.wait_for_result()

#         self._resultado = self.client.get_result()
#         print("Result: "+str(self._resultado))

#     def doneCb (self,state,result):
#         print("estado final:"+str(state))
#         print("resultado: "+ str(result))

#     def activeCb (self):
#         print("Objetivo ativado")

#     def feedbackCb(self,feedback):
#         print("feedback recebido, movimentar para : "+str(feedback.NextMoveDirection))




def main(args=None):
    rospy.init_node('movement')
    movement = Movement()
    rospy.spin()


if __name__ == '__main__':
    main()
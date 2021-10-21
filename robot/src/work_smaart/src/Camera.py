#!/usr/bin/env python3

import socket
import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge
from sensor_msgs.msg import CompressedImage

import pickle
import socket
import time
import struct
import os

HOST = os.environ['MAZE_HOST']  # The server's hostname or IP address
PORT = int(os.environ['MAZE_PORT'])

VERBOSE=rospy.get_param('~verbose',False)

class Camera():

    def __init__(self):
        print("Starting Camera")
        self.img = None
        self.cvb = CvBridge()
        self.publisher = rospy.Publisher('camera/image/compressed', CompressedImage, queue_size=10)
        if VERBOSE:
            rospy.logdebug('Published initialized at topic: /camera/image/compressed')
            print("Published initialized at topic: /camera/image/compressed")
        

        
        payload_size = struct.calcsize(">L")
        print("payload_size: {}".format(payload_size))

        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.connect((HOST, PORT))
            s.recv(255).decode("utf8")
            s.sendall(b"cam")
            print(s.recv(255).decode("utf8"))

            rate = rospy.Rate(2)
            old_frame = None

            
            while not rospy.is_shutdown():   
                data = b""
                while len(data) < payload_size:
                    data += s.recv(4096)

                packed_msg_size = data[:payload_size]
                data = data[payload_size:]
                msg_size = struct.unpack(">L", packed_msg_size)[0]

                while len(data) < msg_size:
                    data += s.recv(4096)
                frame_data = data[:msg_size]
                data = data[msg_size:]

                frame=pickle.loads(frame_data, fix_imports=True, encoding="bytes")
                self.publisher.publish(self.cvb.cv2_to_compressed_imgmsg(frame))
                    
                # old_frame = frame
                rate.sleep()

        # #### READ IMAGE FROM PATH ####
        # self.img = cv2.imread("/home/daniel/Imagens/test2.jpeg")
        # rate = rospy.Rate(10) # 10hz
        # #### CREATE COMPRESSEDIMAGE HERE ####
        # while not rospy.is_shutdown():
            
        #     if self.img is not None:
        #         self.publisher.publish(self.cvb.cv2_to_compressed_imgmsg(self.img))
        #     rate.sleep()




def main(args=None):
    rospy.init_node('camera')
    camera = Camera()

    ##rospy.spin()


if __name__ == '__main__':
    main()

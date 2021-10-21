;; Auto-generated. Do not edit!


(when (boundp 'work_smaart::isGoal)
  (if (not (find-package "WORK_SMAART"))
    (make-package "WORK_SMAART"))
  (shadow 'isGoal (find-package "WORK_SMAART")))
(unless (find-package "WORK_SMAART::ISGOAL")
  (make-package "WORK_SMAART::ISGOAL"))
(unless (find-package "WORK_SMAART::ISGOALREQUEST")
  (make-package "WORK_SMAART::ISGOALREQUEST"))
(unless (find-package "WORK_SMAART::ISGOALRESPONSE")
  (make-package "WORK_SMAART::ISGOALRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass work_smaart::isGoalRequest
  :super ros::object
  :slots (_pos ))

(defmethod work_smaart::isGoalRequest
  (:init
   (&key
    ((:pos __pos) (instance geometry_msgs::Point32 :init))
    )
   (send-super :init)
   (setq _pos __pos)
   self)
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32 _pos
    (send _pos :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point32 _pos
       (send _pos :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point32 _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;;
   self)
  )

(defclass work_smaart::isGoalResponse
  :super ros::object
  :slots (_isGoal ))

(defmethod work_smaart::isGoalResponse
  (:init
   (&key
    ((:isGoal __isGoal) nil)
    )
   (send-super :init)
   (setq _isGoal __isGoal)
   self)
  (:isGoal
   (&optional (__isGoal :null))
   (if (not (eq __isGoal :null)) (setq _isGoal __isGoal)) _isGoal)
  (:serialization-length
   ()
   (+
    ;; bool _isGoal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _isGoal
       (if _isGoal (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _isGoal
     (setq _isGoal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass work_smaart::isGoal
  :super ros::object
  :slots ())

(setf (get work_smaart::isGoal :md5sum-) "1b7b9b83759f54d801ad41a9a10d9074")
(setf (get work_smaart::isGoal :datatype-) "work_smaart/isGoal")
(setf (get work_smaart::isGoal :request) work_smaart::isGoalRequest)
(setf (get work_smaart::isGoal :response) work_smaart::isGoalResponse)

(defmethod work_smaart::isGoalRequest
  (:response () (instance work_smaart::isGoalResponse :init)))

(setf (get work_smaart::isGoalRequest :md5sum-) "1b7b9b83759f54d801ad41a9a10d9074")
(setf (get work_smaart::isGoalRequest :datatype-) "work_smaart/isGoalRequest")
(setf (get work_smaart::isGoalRequest :definition-)
      "geometry_msgs/Point32 pos

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
---
bool isGoal
")

(setf (get work_smaart::isGoalResponse :md5sum-) "1b7b9b83759f54d801ad41a9a10d9074")
(setf (get work_smaart::isGoalResponse :datatype-) "work_smaart/isGoalResponse")
(setf (get work_smaart::isGoalResponse :definition-)
      "geometry_msgs/Point32 pos

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
---
bool isGoal
")



(provide :work_smaart/isGoal "1b7b9b83759f54d801ad41a9a10d9074")



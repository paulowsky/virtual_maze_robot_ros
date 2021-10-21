;; Auto-generated. Do not edit!


(when (boundp 'work_smaart::Point32)
  (if (not (find-package "WORK_SMAART"))
    (make-package "WORK_SMAART"))
  (shadow 'Point32 (find-package "WORK_SMAART")))
(unless (find-package "WORK_SMAART::POINT32")
  (make-package "WORK_SMAART::POINT32"))

(in-package "ROS")
;;//! \htmlinclude Point32.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass work_smaart::Point32
  :super ros::object
  :slots (_posicao ))

(defmethod work_smaart::Point32
  (:init
   (&key
    ((:posicao __posicao) (instance geometry_msgs::Point32 :init))
    )
   (send-super :init)
   (setq _posicao __posicao)
   self)
  (:posicao
   (&rest __posicao)
   (if (keywordp (car __posicao))
       (send* _posicao __posicao)
     (progn
       (if __posicao (setq _posicao (car __posicao)))
       _posicao)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point32 _posicao
    (send _posicao :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point32 _posicao
       (send _posicao :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point32 _posicao
     (send _posicao :deserialize buf ptr-) (incf ptr- (send _posicao :serialization-length))
   ;;
   self)
  )

(setf (get work_smaart::Point32 :md5sum-) "8346df72a1510091ffcefeb2f51167a7")
(setf (get work_smaart::Point32 :datatype-) "work_smaart/Point32")
(setf (get work_smaart::Point32 :definition-)
      "geometry_msgs/Point32 posicao
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
float32 z
")



(provide :work_smaart/Point32 "8346df72a1510091ffcefeb2f51167a7")



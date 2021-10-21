; Auto-generated. Do not edit!


(cl:in-package work_smaart-srv)


;//! \htmlinclude isGoal-request.msg.html

(cl:defclass <isGoal-request> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32)))
)

(cl:defclass isGoal-request (<isGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <isGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'isGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-srv:<isGoal-request> is deprecated: use work_smaart-srv:isGoal-request instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <isGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-srv:pos-val is deprecated.  Use work_smaart-srv:pos instead.")
  (pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <isGoal-request>) ostream)
  "Serializes a message object of type '<isGoal-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <isGoal-request>) istream)
  "Deserializes a message object of type '<isGoal-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<isGoal-request>)))
  "Returns string type for a service object of type '<isGoal-request>"
  "work_smaart/isGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'isGoal-request)))
  "Returns string type for a service object of type 'isGoal-request"
  "work_smaart/isGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<isGoal-request>)))
  "Returns md5sum for a message object of type '<isGoal-request>"
  "1b7b9b83759f54d801ad41a9a10d9074")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'isGoal-request)))
  "Returns md5sum for a message object of type 'isGoal-request"
  "1b7b9b83759f54d801ad41a9a10d9074")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<isGoal-request>)))
  "Returns full string definition for message of type '<isGoal-request>"
  (cl:format cl:nil "geometry_msgs/Point32 pos~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'isGoal-request)))
  "Returns full string definition for message of type 'isGoal-request"
  (cl:format cl:nil "geometry_msgs/Point32 pos~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <isGoal-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <isGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'isGoal-request
    (cl:cons ':pos (pos msg))
))
;//! \htmlinclude isGoal-response.msg.html

(cl:defclass <isGoal-response> (roslisp-msg-protocol:ros-message)
  ((isGoal
    :reader isGoal
    :initarg :isGoal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass isGoal-response (<isGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <isGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'isGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-srv:<isGoal-response> is deprecated: use work_smaart-srv:isGoal-response instead.")))

(cl:ensure-generic-function 'isGoal-val :lambda-list '(m))
(cl:defmethod isGoal-val ((m <isGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-srv:isGoal-val is deprecated.  Use work_smaart-srv:isGoal instead.")
  (isGoal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <isGoal-response>) ostream)
  "Serializes a message object of type '<isGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isGoal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <isGoal-response>) istream)
  "Deserializes a message object of type '<isGoal-response>"
    (cl:setf (cl:slot-value msg 'isGoal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<isGoal-response>)))
  "Returns string type for a service object of type '<isGoal-response>"
  "work_smaart/isGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'isGoal-response)))
  "Returns string type for a service object of type 'isGoal-response"
  "work_smaart/isGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<isGoal-response>)))
  "Returns md5sum for a message object of type '<isGoal-response>"
  "1b7b9b83759f54d801ad41a9a10d9074")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'isGoal-response)))
  "Returns md5sum for a message object of type 'isGoal-response"
  "1b7b9b83759f54d801ad41a9a10d9074")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<isGoal-response>)))
  "Returns full string definition for message of type '<isGoal-response>"
  (cl:format cl:nil "bool isGoal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'isGoal-response)))
  "Returns full string definition for message of type 'isGoal-response"
  (cl:format cl:nil "bool isGoal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <isGoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <isGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'isGoal-response
    (cl:cons ':isGoal (isGoal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'isGoal)))
  'isGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'isGoal)))
  'isGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'isGoal)))
  "Returns string type for a service object of type '<isGoal>"
  "work_smaart/isGoal")
; Auto-generated. Do not edit!


(cl:in-package work_smaart-msg)


;//! \htmlinclude Point32.msg.html

(cl:defclass <Point32> (roslisp-msg-protocol:ros-message)
  ((posicao
    :reader posicao
    :initarg :posicao
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32)))
)

(cl:defclass Point32 (<Point32>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Point32>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Point32)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-msg:<Point32> is deprecated: use work_smaart-msg:Point32 instead.")))

(cl:ensure-generic-function 'posicao-val :lambda-list '(m))
(cl:defmethod posicao-val ((m <Point32>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-msg:posicao-val is deprecated.  Use work_smaart-msg:posicao instead.")
  (posicao m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Point32>) ostream)
  "Serializes a message object of type '<Point32>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'posicao) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Point32>) istream)
  "Deserializes a message object of type '<Point32>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'posicao) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Point32>)))
  "Returns string type for a message object of type '<Point32>"
  "work_smaart/Point32")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Point32)))
  "Returns string type for a message object of type 'Point32"
  "work_smaart/Point32")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Point32>)))
  "Returns md5sum for a message object of type '<Point32>"
  "8346df72a1510091ffcefeb2f51167a7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Point32)))
  "Returns md5sum for a message object of type 'Point32"
  "8346df72a1510091ffcefeb2f51167a7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Point32>)))
  "Returns full string definition for message of type '<Point32>"
  (cl:format cl:nil "geometry_msgs/Point32 posicao~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Point32)))
  "Returns full string definition for message of type 'Point32"
  (cl:format cl:nil "geometry_msgs/Point32 posicao~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Point32>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'posicao))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Point32>))
  "Converts a ROS message object to a list"
  (cl:list 'Point32
    (cl:cons ':posicao (posicao msg))
))

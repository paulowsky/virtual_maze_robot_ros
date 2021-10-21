; Auto-generated. Do not edit!


(cl:in-package work_smaart-msg)


;//! \htmlinclude Bools.msg.html

(cl:defclass <Bools> (roslisp-msg-protocol:ros-message)
  ((isWeak
    :reader isWeak
    :initarg :isWeak
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Bools (<Bools>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Bools>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Bools)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-msg:<Bools> is deprecated: use work_smaart-msg:Bools instead.")))

(cl:ensure-generic-function 'isWeak-val :lambda-list '(m))
(cl:defmethod isWeak-val ((m <Bools>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-msg:isWeak-val is deprecated.  Use work_smaart-msg:isWeak instead.")
  (isWeak m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Bools>) ostream)
  "Serializes a message object of type '<Bools>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isWeak) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Bools>) istream)
  "Deserializes a message object of type '<Bools>"
    (cl:setf (cl:slot-value msg 'isWeak) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Bools>)))
  "Returns string type for a message object of type '<Bools>"
  "work_smaart/Bools")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Bools)))
  "Returns string type for a message object of type 'Bools"
  "work_smaart/Bools")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Bools>)))
  "Returns md5sum for a message object of type '<Bools>"
  "902658ae4fcb9d45c767db4811cab8bd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Bools)))
  "Returns md5sum for a message object of type 'Bools"
  "902658ae4fcb9d45c767db4811cab8bd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Bools>)))
  "Returns full string definition for message of type '<Bools>"
  (cl:format cl:nil "bool isWeak~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Bools)))
  "Returns full string definition for message of type 'Bools"
  (cl:format cl:nil "bool isWeak~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Bools>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Bools>))
  "Converts a ROS message object to a list"
  (cl:list 'Bools
    (cl:cons ':isWeak (isWeak msg))
))

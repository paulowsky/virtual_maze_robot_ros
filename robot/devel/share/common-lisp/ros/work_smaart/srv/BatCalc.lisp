; Auto-generated. Do not edit!


(cl:in-package work_smaart-srv)


;//! \htmlinclude BatCalc-request.msg.html

(cl:defclass <BatCalc-request> (roslisp-msg-protocol:ros-message)
  ((dist
    :reader dist
    :initarg :dist
    :type cl:integer
    :initform 0)
   (numeroMovements
    :reader numeroMovements
    :initarg :numeroMovements
    :type cl:integer
    :initform 0))
)

(cl:defclass BatCalc-request (<BatCalc-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatCalc-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatCalc-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-srv:<BatCalc-request> is deprecated: use work_smaart-srv:BatCalc-request instead.")))

(cl:ensure-generic-function 'dist-val :lambda-list '(m))
(cl:defmethod dist-val ((m <BatCalc-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-srv:dist-val is deprecated.  Use work_smaart-srv:dist instead.")
  (dist m))

(cl:ensure-generic-function 'numeroMovements-val :lambda-list '(m))
(cl:defmethod numeroMovements-val ((m <BatCalc-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-srv:numeroMovements-val is deprecated.  Use work_smaart-srv:numeroMovements instead.")
  (numeroMovements m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatCalc-request>) ostream)
  "Serializes a message object of type '<BatCalc-request>"
  (cl:let* ((signed (cl:slot-value msg 'dist)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'numeroMovements)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatCalc-request>) istream)
  "Deserializes a message object of type '<BatCalc-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dist) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'numeroMovements) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatCalc-request>)))
  "Returns string type for a service object of type '<BatCalc-request>"
  "work_smaart/BatCalcRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatCalc-request)))
  "Returns string type for a service object of type 'BatCalc-request"
  "work_smaart/BatCalcRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatCalc-request>)))
  "Returns md5sum for a message object of type '<BatCalc-request>"
  "2827f36d9d76178675d17a203abff3a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatCalc-request)))
  "Returns md5sum for a message object of type 'BatCalc-request"
  "2827f36d9d76178675d17a203abff3a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatCalc-request>)))
  "Returns full string definition for message of type '<BatCalc-request>"
  (cl:format cl:nil "int64 dist~%int64 numeroMovements~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatCalc-request)))
  "Returns full string definition for message of type 'BatCalc-request"
  (cl:format cl:nil "int64 dist~%int64 numeroMovements~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatCalc-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatCalc-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BatCalc-request
    (cl:cons ':dist (dist msg))
    (cl:cons ':numeroMovements (numeroMovements msg))
))
;//! \htmlinclude BatCalc-response.msg.html

(cl:defclass <BatCalc-response> (roslisp-msg-protocol:ros-message)
  ((isWeak
    :reader isWeak
    :initarg :isWeak
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass BatCalc-response (<BatCalc-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BatCalc-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BatCalc-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name work_smaart-srv:<BatCalc-response> is deprecated: use work_smaart-srv:BatCalc-response instead.")))

(cl:ensure-generic-function 'isWeak-val :lambda-list '(m))
(cl:defmethod isWeak-val ((m <BatCalc-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader work_smaart-srv:isWeak-val is deprecated.  Use work_smaart-srv:isWeak instead.")
  (isWeak m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BatCalc-response>) ostream)
  "Serializes a message object of type '<BatCalc-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'isWeak) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BatCalc-response>) istream)
  "Deserializes a message object of type '<BatCalc-response>"
    (cl:setf (cl:slot-value msg 'isWeak) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BatCalc-response>)))
  "Returns string type for a service object of type '<BatCalc-response>"
  "work_smaart/BatCalcResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatCalc-response)))
  "Returns string type for a service object of type 'BatCalc-response"
  "work_smaart/BatCalcResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BatCalc-response>)))
  "Returns md5sum for a message object of type '<BatCalc-response>"
  "2827f36d9d76178675d17a203abff3a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BatCalc-response)))
  "Returns md5sum for a message object of type 'BatCalc-response"
  "2827f36d9d76178675d17a203abff3a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BatCalc-response>)))
  "Returns full string definition for message of type '<BatCalc-response>"
  (cl:format cl:nil "bool isWeak~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BatCalc-response)))
  "Returns full string definition for message of type 'BatCalc-response"
  (cl:format cl:nil "bool isWeak~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BatCalc-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BatCalc-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BatCalc-response
    (cl:cons ':isWeak (isWeak msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BatCalc)))
  'BatCalc-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BatCalc)))
  'BatCalc-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BatCalc)))
  "Returns string type for a service object of type '<BatCalc>"
  "work_smaart/BatCalc")
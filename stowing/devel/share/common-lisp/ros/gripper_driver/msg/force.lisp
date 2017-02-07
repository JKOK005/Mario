; Auto-generated. Do not edit!


(cl:in-package gripper_driver-msg)


;//! \htmlinclude force.msg.html

(cl:defclass <force> (roslisp-msg-protocol:ros-message)
  ((force1
    :reader force1
    :initarg :force1
    :type cl:float
    :initform 0.0)
   (force2
    :reader force2
    :initarg :force2
    :type cl:float
    :initform 0.0))
)

(cl:defclass force (<force>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <force>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'force)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gripper_driver-msg:<force> is deprecated: use gripper_driver-msg:force instead.")))

(cl:ensure-generic-function 'force1-val :lambda-list '(m))
(cl:defmethod force1-val ((m <force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:force1-val is deprecated.  Use gripper_driver-msg:force1 instead.")
  (force1 m))

(cl:ensure-generic-function 'force2-val :lambda-list '(m))
(cl:defmethod force2-val ((m <force>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:force2-val is deprecated.  Use gripper_driver-msg:force2 instead.")
  (force2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <force>) ostream)
  "Serializes a message object of type '<force>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'force2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <force>) istream)
  "Deserializes a message object of type '<force>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'force2) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<force>)))
  "Returns string type for a message object of type '<force>"
  "gripper_driver/force")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'force)))
  "Returns string type for a message object of type 'force"
  "gripper_driver/force")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<force>)))
  "Returns md5sum for a message object of type '<force>"
  "d9d3e01eac811d943f8a2b6fd30fe322")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'force)))
  "Returns md5sum for a message object of type 'force"
  "d9d3e01eac811d943f8a2b6fd30fe322")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<force>)))
  "Returns full string definition for message of type '<force>"
  (cl:format cl:nil "float32 force1~%float32 force2~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'force)))
  "Returns full string definition for message of type 'force"
  (cl:format cl:nil "float32 force1~%float32 force2~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <force>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <force>))
  "Converts a ROS message object to a list"
  (cl:list 'force
    (cl:cons ':force1 (force1 msg))
    (cl:cons ':force2 (force2 msg))
))

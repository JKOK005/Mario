; Auto-generated. Do not edit!


(cl:in-package gripper_driver-msg)


;//! \htmlinclude motor_state.msg.html

(cl:defclass <motor_state> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (load
    :reader load
    :initarg :load
    :type cl:float
    :initform 0.0))
)

(cl:defclass motor_state (<motor_state>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_state>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_state)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gripper_driver-msg:<motor_state> is deprecated: use gripper_driver-msg:motor_state instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <motor_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:angle-val is deprecated.  Use gripper_driver-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'load-val :lambda-list '(m))
(cl:defmethod load-val ((m <motor_state>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:load-val is deprecated.  Use gripper_driver-msg:load instead.")
  (load m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_state>) ostream)
  "Serializes a message object of type '<motor_state>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'load))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_state>) istream)
  "Deserializes a message object of type '<motor_state>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'load) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_state>)))
  "Returns string type for a message object of type '<motor_state>"
  "gripper_driver/motor_state")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_state)))
  "Returns string type for a message object of type 'motor_state"
  "gripper_driver/motor_state")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_state>)))
  "Returns md5sum for a message object of type '<motor_state>"
  "821acdedeefedb4e32bbd235e52cfd8f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_state)))
  "Returns md5sum for a message object of type 'motor_state"
  "821acdedeefedb4e32bbd235e52cfd8f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_state>)))
  "Returns full string definition for message of type '<motor_state>"
  (cl:format cl:nil "float32 angle~%float32 load~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_state)))
  "Returns full string definition for message of type 'motor_state"
  (cl:format cl:nil "float32 angle~%float32 load~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_state>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_state>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_state
    (cl:cons ':angle (angle msg))
    (cl:cons ':load (load msg))
))

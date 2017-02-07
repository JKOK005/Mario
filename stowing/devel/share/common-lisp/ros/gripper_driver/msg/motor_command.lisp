; Auto-generated. Do not edit!


(cl:in-package gripper_driver-msg)


;//! \htmlinclude motor_command.msg.html

(cl:defclass <motor_command> (roslisp-msg-protocol:ros-message)
  ((read_angle
    :reader read_angle
    :initarg :read_angle
    :type cl:boolean
    :initform cl:nil)
   (read_load
    :reader read_load
    :initarg :read_load
    :type cl:boolean
    :initform cl:nil)
   (gripper_ready
    :reader gripper_ready
    :initarg :gripper_ready
    :type cl:boolean
    :initform cl:nil)
   (gripper_open
    :reader gripper_open
    :initarg :gripper_open
    :type cl:boolean
    :initform cl:nil)
   (gripper_close
    :reader gripper_close
    :initarg :gripper_close
    :type cl:boolean
    :initform cl:nil)
   (gripper_standby
    :reader gripper_standby
    :initarg :gripper_standby
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass motor_command (<motor_command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gripper_driver-msg:<motor_command> is deprecated: use gripper_driver-msg:motor_command instead.")))

(cl:ensure-generic-function 'read_angle-val :lambda-list '(m))
(cl:defmethod read_angle-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:read_angle-val is deprecated.  Use gripper_driver-msg:read_angle instead.")
  (read_angle m))

(cl:ensure-generic-function 'read_load-val :lambda-list '(m))
(cl:defmethod read_load-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:read_load-val is deprecated.  Use gripper_driver-msg:read_load instead.")
  (read_load m))

(cl:ensure-generic-function 'gripper_ready-val :lambda-list '(m))
(cl:defmethod gripper_ready-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:gripper_ready-val is deprecated.  Use gripper_driver-msg:gripper_ready instead.")
  (gripper_ready m))

(cl:ensure-generic-function 'gripper_open-val :lambda-list '(m))
(cl:defmethod gripper_open-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:gripper_open-val is deprecated.  Use gripper_driver-msg:gripper_open instead.")
  (gripper_open m))

(cl:ensure-generic-function 'gripper_close-val :lambda-list '(m))
(cl:defmethod gripper_close-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:gripper_close-val is deprecated.  Use gripper_driver-msg:gripper_close instead.")
  (gripper_close m))

(cl:ensure-generic-function 'gripper_standby-val :lambda-list '(m))
(cl:defmethod gripper_standby-val ((m <motor_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gripper_driver-msg:gripper_standby-val is deprecated.  Use gripper_driver-msg:gripper_standby instead.")
  (gripper_standby m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_command>) ostream)
  "Serializes a message object of type '<motor_command>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'read_angle) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'read_load) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gripper_ready) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gripper_open) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gripper_close) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'gripper_standby) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_command>) istream)
  "Deserializes a message object of type '<motor_command>"
    (cl:setf (cl:slot-value msg 'read_angle) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'read_load) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gripper_ready) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gripper_open) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gripper_close) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'gripper_standby) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_command>)))
  "Returns string type for a message object of type '<motor_command>"
  "gripper_driver/motor_command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_command)))
  "Returns string type for a message object of type 'motor_command"
  "gripper_driver/motor_command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_command>)))
  "Returns md5sum for a message object of type '<motor_command>"
  "8abb8dc4e270785b228e26d3dff0970e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_command)))
  "Returns md5sum for a message object of type 'motor_command"
  "8abb8dc4e270785b228e26d3dff0970e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_command>)))
  "Returns full string definition for message of type '<motor_command>"
  (cl:format cl:nil "bool read_angle~%bool read_load~%bool gripper_ready~%bool gripper_open~%bool gripper_close~%bool gripper_standby~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_command)))
  "Returns full string definition for message of type 'motor_command"
  (cl:format cl:nil "bool read_angle~%bool read_load~%bool gripper_ready~%bool gripper_open~%bool gripper_close~%bool gripper_standby~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_command>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_command>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_command
    (cl:cons ':read_angle (read_angle msg))
    (cl:cons ':read_load (read_load msg))
    (cl:cons ':gripper_ready (gripper_ready msg))
    (cl:cons ':gripper_open (gripper_open msg))
    (cl:cons ':gripper_close (gripper_close msg))
    (cl:cons ':gripper_standby (gripper_standby msg))
))

; Auto-generated. Do not edit!


(cl:in-package object_manipulation_msgs-msg)


;//! \htmlinclude GraspHandPostureExecutionGoal.msg.html

(cl:defclass <GraspHandPostureExecutionGoal> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0)
   (max_contact_force
    :reader max_contact_force
    :initarg :max_contact_force
    :type cl:float
    :initform 0.0))
)

(cl:defclass GraspHandPostureExecutionGoal (<GraspHandPostureExecutionGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GraspHandPostureExecutionGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GraspHandPostureExecutionGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_manipulation_msgs-msg:<GraspHandPostureExecutionGoal> is deprecated: use object_manipulation_msgs-msg:GraspHandPostureExecutionGoal instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GraspHandPostureExecutionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_manipulation_msgs-msg:goal-val is deprecated.  Use object_manipulation_msgs-msg:goal instead.")
  (goal m))

(cl:ensure-generic-function 'max_contact_force-val :lambda-list '(m))
(cl:defmethod max_contact_force-val ((m <GraspHandPostureExecutionGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_manipulation_msgs-msg:max_contact_force-val is deprecated.  Use object_manipulation_msgs-msg:max_contact_force instead.")
  (max_contact_force m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<GraspHandPostureExecutionGoal>)))
    "Constants for message type '<GraspHandPostureExecutionGoal>"
  '((:PRE_GRASP . 1)
    (:GRASP . 2)
    (:RELEASE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'GraspHandPostureExecutionGoal)))
    "Constants for message type 'GraspHandPostureExecutionGoal"
  '((:PRE_GRASP . 1)
    (:GRASP . 2)
    (:RELEASE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GraspHandPostureExecutionGoal>) ostream)
  "Serializes a message object of type '<GraspHandPostureExecutionGoal>"
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_contact_force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GraspHandPostureExecutionGoal>) istream)
  "Deserializes a message object of type '<GraspHandPostureExecutionGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_contact_force) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GraspHandPostureExecutionGoal>)))
  "Returns string type for a message object of type '<GraspHandPostureExecutionGoal>"
  "object_manipulation_msgs/GraspHandPostureExecutionGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GraspHandPostureExecutionGoal)))
  "Returns string type for a message object of type 'GraspHandPostureExecutionGoal"
  "object_manipulation_msgs/GraspHandPostureExecutionGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GraspHandPostureExecutionGoal>)))
  "Returns md5sum for a message object of type '<GraspHandPostureExecutionGoal>"
  "9cec28822e940e0fb2724071cba8ee7e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GraspHandPostureExecutionGoal)))
  "Returns md5sum for a message object of type 'GraspHandPostureExecutionGoal"
  "9cec28822e940e0fb2724071cba8ee7e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GraspHandPostureExecutionGoal>)))
  "Returns full string definition for message of type '<GraspHandPostureExecutionGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# an action for requesting the finger posture part of grasp be physically carried out by a hand~%# the name of the arm being used is not in here, as this will be sent to a specific action server~%# for each arm~%~%# the grasp to be executed~%#manipulation_msgs/Grasp grasp~%~%# the goal of this action~%# requests that the hand be set in the pre-grasp posture~%int32 PRE_GRASP=1~%# requests that the hand execute the actual grasp~%int32 GRASP=2~%# requests that the hand open to release the object~%int32 RELEASE=3~%int32 goal~%~%# the max contact force to use (<=0 if no desired max)~%float32 max_contact_force~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GraspHandPostureExecutionGoal)))
  "Returns full string definition for message of type 'GraspHandPostureExecutionGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# an action for requesting the finger posture part of grasp be physically carried out by a hand~%# the name of the arm being used is not in here, as this will be sent to a specific action server~%# for each arm~%~%# the grasp to be executed~%#manipulation_msgs/Grasp grasp~%~%# the goal of this action~%# requests that the hand be set in the pre-grasp posture~%int32 PRE_GRASP=1~%# requests that the hand execute the actual grasp~%int32 GRASP=2~%# requests that the hand open to release the object~%int32 RELEASE=3~%int32 goal~%~%# the max contact force to use (<=0 if no desired max)~%float32 max_contact_force~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GraspHandPostureExecutionGoal>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GraspHandPostureExecutionGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GraspHandPostureExecutionGoal
    (cl:cons ':goal (goal msg))
    (cl:cons ':max_contact_force (max_contact_force msg))
))

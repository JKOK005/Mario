; Auto-generated. Do not edit!


(cl:in-package ur_msgs-msg)


;//! \htmlinclude IOStates.msg.html

(cl:defclass <IOStates> (roslisp-msg-protocol:ros-message)
  ((states
    :reader states
    :initarg :states
    :type (cl:vector ur_msgs-msg:IOState)
   :initform (cl:make-array 0 :element-type 'ur_msgs-msg:IOState :initial-element (cl:make-instance 'ur_msgs-msg:IOState))))
)

(cl:defclass IOStates (<IOStates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IOStates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IOStates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_msgs-msg:<IOStates> is deprecated: use ur_msgs-msg:IOStates instead.")))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <IOStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_msgs-msg:states-val is deprecated.  Use ur_msgs-msg:states instead.")
  (states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IOStates>) ostream)
  "Serializes a message object of type '<IOStates>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IOStates>) istream)
  "Deserializes a message object of type '<IOStates>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ur_msgs-msg:IOState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IOStates>)))
  "Returns string type for a message object of type '<IOStates>"
  "ur_msgs/IOStates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IOStates)))
  "Returns string type for a message object of type 'IOStates"
  "ur_msgs/IOStates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IOStates>)))
  "Returns md5sum for a message object of type '<IOStates>"
  "6606a35d5f8d4c69b9dcc616f29b2f4c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IOStates)))
  "Returns md5sum for a message object of type 'IOStates"
  "6606a35d5f8d4c69b9dcc616f29b2f4c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IOStates>)))
  "Returns full string definition for message of type '<IOStates>"
  (cl:format cl:nil "IOState[] states~%~%================================================================================~%MSG: ur_msgs/IOState~%uint8 pin~%float32 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IOStates)))
  "Returns full string definition for message of type 'IOStates"
  (cl:format cl:nil "IOState[] states~%~%================================================================================~%MSG: ur_msgs/IOState~%uint8 pin~%float32 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IOStates>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IOStates>))
  "Converts a ROS message object to a list"
  (cl:list 'IOStates
    (cl:cons ':states (states msg))
))

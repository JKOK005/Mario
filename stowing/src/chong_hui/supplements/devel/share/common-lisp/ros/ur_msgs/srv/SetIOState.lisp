; Auto-generated. Do not edit!


(cl:in-package ur_msgs-srv)


;//! \htmlinclude SetIOState-request.msg.html

(cl:defclass <SetIOState-request> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type ur_msgs-msg:IOState
    :initform (cl:make-instance 'ur_msgs-msg:IOState)))
)

(cl:defclass SetIOState-request (<SetIOState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetIOState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetIOState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_msgs-srv:<SetIOState-request> is deprecated: use ur_msgs-srv:SetIOState-request instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <SetIOState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur_msgs-srv:state-val is deprecated.  Use ur_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetIOState-request>) ostream)
  "Serializes a message object of type '<SetIOState-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetIOState-request>) istream)
  "Deserializes a message object of type '<SetIOState-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetIOState-request>)))
  "Returns string type for a service object of type '<SetIOState-request>"
  "ur_msgs/SetIOStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetIOState-request)))
  "Returns string type for a service object of type 'SetIOState-request"
  "ur_msgs/SetIOStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetIOState-request>)))
  "Returns md5sum for a message object of type '<SetIOState-request>"
  "f64be696f2ca8bdab03c1bd1dace31cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetIOState-request)))
  "Returns md5sum for a message object of type 'SetIOState-request"
  "f64be696f2ca8bdab03c1bd1dace31cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetIOState-request>)))
  "Returns full string definition for message of type '<SetIOState-request>"
  (cl:format cl:nil "IOState state~%~%================================================================================~%MSG: ur_msgs/IOState~%uint8 pin~%float32 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetIOState-request)))
  "Returns full string definition for message of type 'SetIOState-request"
  (cl:format cl:nil "IOState state~%~%================================================================================~%MSG: ur_msgs/IOState~%uint8 pin~%float32 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetIOState-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetIOState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetIOState-request
    (cl:cons ':state (state msg))
))
;//! \htmlinclude SetIOState-response.msg.html

(cl:defclass <SetIOState-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetIOState-response (<SetIOState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetIOState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetIOState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur_msgs-srv:<SetIOState-response> is deprecated: use ur_msgs-srv:SetIOState-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetIOState-response>) ostream)
  "Serializes a message object of type '<SetIOState-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetIOState-response>) istream)
  "Deserializes a message object of type '<SetIOState-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetIOState-response>)))
  "Returns string type for a service object of type '<SetIOState-response>"
  "ur_msgs/SetIOStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetIOState-response)))
  "Returns string type for a service object of type 'SetIOState-response"
  "ur_msgs/SetIOStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetIOState-response>)))
  "Returns md5sum for a message object of type '<SetIOState-response>"
  "f64be696f2ca8bdab03c1bd1dace31cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetIOState-response)))
  "Returns md5sum for a message object of type 'SetIOState-response"
  "f64be696f2ca8bdab03c1bd1dace31cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetIOState-response>)))
  "Returns full string definition for message of type '<SetIOState-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetIOState-response)))
  "Returns full string definition for message of type 'SetIOState-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetIOState-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetIOState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetIOState-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetIOState)))
  'SetIOState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetIOState)))
  'SetIOState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetIOState)))
  "Returns string type for a service object of type '<SetIOState>"
  "ur_msgs/SetIOState")
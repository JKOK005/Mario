
(cl:in-package :asdf)

(defsystem "ur_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :ur_msgs-msg
)
  :components ((:file "_package")
    (:file "SetIOState" :depends-on ("_package_SetIOState"))
    (:file "_package_SetIOState" :depends-on ("_package"))
  ))
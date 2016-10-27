
(cl:in-package :asdf)

(defsystem "ur_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IOState" :depends-on ("_package_IOState"))
    (:file "_package_IOState" :depends-on ("_package"))
    (:file "IOStates" :depends-on ("_package_IOStates"))
    (:file "_package_IOStates" :depends-on ("_package"))
  ))
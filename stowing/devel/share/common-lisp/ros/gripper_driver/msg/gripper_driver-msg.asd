
(cl:in-package :asdf)

(defsystem "gripper_driver-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "force" :depends-on ("_package_force"))
    (:file "_package_force" :depends-on ("_package"))
    (:file "motor_state" :depends-on ("_package_motor_state"))
    (:file "_package_motor_state" :depends-on ("_package"))
    (:file "motor_command" :depends-on ("_package_motor_command"))
    (:file "_package_motor_command" :depends-on ("_package"))
  ))
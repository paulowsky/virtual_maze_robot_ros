
(cl:in-package :asdf)

(defsystem "work_smaart-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "BatCalc" :depends-on ("_package_BatCalc"))
    (:file "_package_BatCalc" :depends-on ("_package"))
    (:file "isGoal" :depends-on ("_package_isGoal"))
    (:file "_package_isGoal" :depends-on ("_package"))
  ))
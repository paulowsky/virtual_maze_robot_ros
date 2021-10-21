;; Auto-generated. Do not edit!


(when (boundp 'work_smaart::Bools)
  (if (not (find-package "WORK_SMAART"))
    (make-package "WORK_SMAART"))
  (shadow 'Bools (find-package "WORK_SMAART")))
(unless (find-package "WORK_SMAART::BOOLS")
  (make-package "WORK_SMAART::BOOLS"))

(in-package "ROS")
;;//! \htmlinclude Bools.msg.html


(defclass work_smaart::Bools
  :super ros::object
  :slots (_isWeak ))

(defmethod work_smaart::Bools
  (:init
   (&key
    ((:isWeak __isWeak) nil)
    )
   (send-super :init)
   (setq _isWeak __isWeak)
   self)
  (:isWeak
   (&optional (__isWeak :null))
   (if (not (eq __isWeak :null)) (setq _isWeak __isWeak)) _isWeak)
  (:serialization-length
   ()
   (+
    ;; bool _isWeak
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _isWeak
       (if _isWeak (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _isWeak
     (setq _isWeak (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get work_smaart::Bools :md5sum-) "902658ae4fcb9d45c767db4811cab8bd")
(setf (get work_smaart::Bools :datatype-) "work_smaart/Bools")
(setf (get work_smaart::Bools :definition-)
      "bool isWeak
")



(provide :work_smaart/Bools "902658ae4fcb9d45c767db4811cab8bd")



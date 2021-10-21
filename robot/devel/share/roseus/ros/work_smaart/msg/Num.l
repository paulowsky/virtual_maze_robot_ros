;; Auto-generated. Do not edit!


(when (boundp 'work_smaart::Num)
  (if (not (find-package "WORK_SMAART"))
    (make-package "WORK_SMAART"))
  (shadow 'Num (find-package "WORK_SMAART")))
(unless (find-package "WORK_SMAART::NUM")
  (make-package "WORK_SMAART::NUM"))

(in-package "ROS")
;;//! \htmlinclude Num.msg.html


(defclass work_smaart::Num
  :super ros::object
  :slots (_dist ))

(defmethod work_smaart::Num
  (:init
   (&key
    ((:dist __dist) 0)
    )
   (send-super :init)
   (setq _dist (round __dist))
   self)
  (:dist
   (&optional __dist)
   (if __dist (setq _dist __dist)) _dist)
  (:serialization-length
   ()
   (+
    ;; int64 _dist
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _dist
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _dist (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _dist) (= (length (_dist . bv)) 2)) ;; bignum
              (write-long (ash (elt (_dist . bv) 0) 0) s)
              (write-long (ash (elt (_dist . bv) 1) -1) s))
             ((and (class _dist) (= (length (_dist . bv)) 1)) ;; big1
              (write-long (elt (_dist . bv) 0) s)
              (write-long (if (>= _dist 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _dist s)(write-long (if (>= _dist 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _dist
#+(or :alpha :irix6 :x86_64)
      (setf _dist (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _dist (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get work_smaart::Num :md5sum-) "f1177a5a6d683bdd440563d77ed5b58d")
(setf (get work_smaart::Num :datatype-) "work_smaart/Num")
(setf (get work_smaart::Num :definition-)
      "int64 dist
")



(provide :work_smaart/Num "f1177a5a6d683bdd440563d77ed5b58d")



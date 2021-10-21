;; Auto-generated. Do not edit!


(when (boundp 'work_smaart::BatCalc)
  (if (not (find-package "WORK_SMAART"))
    (make-package "WORK_SMAART"))
  (shadow 'BatCalc (find-package "WORK_SMAART")))
(unless (find-package "WORK_SMAART::BATCALC")
  (make-package "WORK_SMAART::BATCALC"))
(unless (find-package "WORK_SMAART::BATCALCREQUEST")
  (make-package "WORK_SMAART::BATCALCREQUEST"))
(unless (find-package "WORK_SMAART::BATCALCRESPONSE")
  (make-package "WORK_SMAART::BATCALCRESPONSE"))

(in-package "ROS")





(defclass work_smaart::BatCalcRequest
  :super ros::object
  :slots (_dist _numeroMovements ))

(defmethod work_smaart::BatCalcRequest
  (:init
   (&key
    ((:dist __dist) 0)
    ((:numeroMovements __numeroMovements) 0)
    )
   (send-super :init)
   (setq _dist (round __dist))
   (setq _numeroMovements (round __numeroMovements))
   self)
  (:dist
   (&optional __dist)
   (if __dist (setq _dist __dist)) _dist)
  (:numeroMovements
   (&optional __numeroMovements)
   (if __numeroMovements (setq _numeroMovements __numeroMovements)) _numeroMovements)
  (:serialization-length
   ()
   (+
    ;; int64 _dist
    8
    ;; int64 _numeroMovements
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
     ;; int64 _numeroMovements
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _numeroMovements (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _numeroMovements) (= (length (_numeroMovements . bv)) 2)) ;; bignum
              (write-long (ash (elt (_numeroMovements . bv) 0) 0) s)
              (write-long (ash (elt (_numeroMovements . bv) 1) -1) s))
             ((and (class _numeroMovements) (= (length (_numeroMovements . bv)) 1)) ;; big1
              (write-long (elt (_numeroMovements . bv) 0) s)
              (write-long (if (>= _numeroMovements 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _numeroMovements s)(write-long (if (>= _numeroMovements 0) 0 #xffffffff) s)))
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
   ;; int64 _numeroMovements
#+(or :alpha :irix6 :x86_64)
      (setf _numeroMovements (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _numeroMovements (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(defclass work_smaart::BatCalcResponse
  :super ros::object
  :slots (_isWeak ))

(defmethod work_smaart::BatCalcResponse
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

(defclass work_smaart::BatCalc
  :super ros::object
  :slots ())

(setf (get work_smaart::BatCalc :md5sum-) "2827f36d9d76178675d17a203abff3a2")
(setf (get work_smaart::BatCalc :datatype-) "work_smaart/BatCalc")
(setf (get work_smaart::BatCalc :request) work_smaart::BatCalcRequest)
(setf (get work_smaart::BatCalc :response) work_smaart::BatCalcResponse)

(defmethod work_smaart::BatCalcRequest
  (:response () (instance work_smaart::BatCalcResponse :init)))

(setf (get work_smaart::BatCalcRequest :md5sum-) "2827f36d9d76178675d17a203abff3a2")
(setf (get work_smaart::BatCalcRequest :datatype-) "work_smaart/BatCalcRequest")
(setf (get work_smaart::BatCalcRequest :definition-)
      "int64 dist
int64 numeroMovements
---
bool isWeak

")

(setf (get work_smaart::BatCalcResponse :md5sum-) "2827f36d9d76178675d17a203abff3a2")
(setf (get work_smaart::BatCalcResponse :datatype-) "work_smaart/BatCalcResponse")
(setf (get work_smaart::BatCalcResponse :definition-)
      "int64 dist
int64 numeroMovements
---
bool isWeak

")



(provide :work_smaart/BatCalc "2827f36d9d76178675d17a203abff3a2")



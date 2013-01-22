(in-package :tds)

(defclass tds-scope-traces (column-major-table)
  ((scope-model :reader scope-model))
  (:documentation "Scope traces"))

(defmethod initialize-instance :after ((self tds-scope-traces) &key)
  (init-storage self))


(defmethod print-object ((self tds-scope-traces) stream)
  (print-unreadable-object (self stream :type t :identity t)
    (format stream "A TDS ~a numeric-table") (scope-model self)))

(defmethod describe-object ((self tds-scope-traces) stream)
  (format stream "A TDS scope trace~%")
  (format stream "Model ~a~%" (scope-model self))
  (format stream "Number of sumples ~a~%" (row-count self)))
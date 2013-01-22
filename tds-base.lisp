(in-package :tds)

(defclass tds-scope-traces (column-major-table)
  ()
  (:documentation "Scope traces"))

(defmethod initialize-instance :after ((self tds-scope-traces) &key)
  (init-storage self))

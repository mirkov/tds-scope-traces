(in-package :tds)

(defclass scope-traces (column-major-table)
  ()
  (:documentation "Scope traces"))

(defmethod initialize-instance :after ((self scope-traces) &key)
  (init-storage self))

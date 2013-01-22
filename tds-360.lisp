(in-package :tds-scope-traces)

(defclass tds-360-traces (scope-traces)
  ((row-count :initform 1000)
   (scope-model :initfrom "TDS-360"))
  (:documentation "Traces acquired by the 360 Tektronix scope"))


(defmethod make-table ((type (eql 'tds-360-traces))
		       table-schema &rest keywords
		       &key &allow-other-keys)
  (let ((table
	 (apply #'make-instance type :table-schema table-schema
		    :allow-other-keys t keywords)))
    table))

(defclass tds-360-column-schema (numeric-table::number-column-schema)
  ()
  (:documentation "Column schema for storing scope traces"))

(numeric-table::add-column-schema-short+long-names 'tds-360 'tds-360-column-schema)



(defmethod make-table-schema ((type (eql 'tds-360-traces)) spec)
  "Create a table schema by looping over list SPEC

SPEC is a list of column names "
  (declare (ignore type))
  (loop :for j from 0
     :for column-spec in spec
     :collect (destructuring-bind
		    (name &key documentation) column-spec
		(let ((column-schema
		       (make-column-schema name 'tds-360
					   :documentation documentation)))
		  (setf (slot-value column-schema 'numeric-table::i-column) j)
		  column-schema))))

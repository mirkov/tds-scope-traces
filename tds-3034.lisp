(in-package :tds-scope-traces)

(defclass tds-3034-traces (scope-traces)
  ((row-count :initform 10000)
   (scope-model :initform "TDS-3034"))
  (:documentation "Traces acquired by the 3034 Tektronix scope"))


(defmethod make-table ((type (eql 'tds-3034-traces))
		       table-schema &rest keywords
		       &key &allow-other-keys)
  (let ((table
	 (apply #'make-instance type :table-schema table-schema
		    :allow-other-keys t keywords)))
    table))

(defclass tds-3034-column-schema (numeric-table::number-column-schema)
  ()
  (:documentation "Column schema for storing scope traces"))

(numeric-table::add-column-schema-short+long-names 'tds-3034 'tds-3034-column-schema)



(defmethod make-table-schema ((type (eql 'tds-3034-traces)) spec)
  "Create a table schema by looping over list SPEC

SPEC is a list of column names "
  (declare (ignore type))
  (loop :for j from 0
     :for column-spec in spec
     :collect (destructuring-bind
		    (name &key documentation) column-spec
		(let ((column-schema
		       (make-column-schema name 'tds-3034
					   :documentation documentation)))
		  (setf (slot-value column-schema 'numeric-table::i-column) j)
		  column-schema))))

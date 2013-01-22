(defpackage :tds-scope-traces
  (:nicknames :tds)
  (:use :cl :lisp-unit :numeric-table :cl-csv)
  (:export :tds-3034 :tds-3034-traces
	   :tds-xyz :tds-xyz-traces)
  (:import-from :alexandria
		:with-input-from-file
		:with-output-to-file)
  (:documentation "Package for reading TDS scope traces"))

(antik:make-user-package "tds-scope-traces")

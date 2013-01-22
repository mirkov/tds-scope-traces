(in-package :tds)

(export '(csv-file))

(defun csv-file (trace-index &optional (directory #P"./"))
  (probe-file
   (merge-pathnames
    (format nil "TEK~5,,,'0@a.csv" trace-index)
    directory)))



(defmethod import-table-from-csv-file (stream (table scope-traces) &key
				       time-column voltage-column)
  (let* ((sample-count (row-count table))
	 (time (make-array sample-count :element-type 'single-float))
	 (voltage (make-array sample-count :element-type 'single-float)))
    (dotimes (i sample-count)
      (setf (aref time i) (read stream))
      (read-char stream)
      (setf (aref voltage i) (read stream)))
    (when time-column
      (setf (table-column time-column) time))
    (when voltage-column
      (setf (table-column voltage-column) voltage))))
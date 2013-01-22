(in-package :tds)

(export '(csv-file))

(defun csv-file (trace-index &optional (directory #P"./"))
  (probe-file
   (merge-pathnames
    (format nil "TEK~5,,,'0@a.csv" trace-index)
    directory)))

(asdf:defsystem :tds-scope-traces
  :serial t
  :author "Mirko Vukovic <mirko.vukovic@us.tel.com>"
  :version "0.1"
  :license "MIT"
  :depends-on ("lisp-unit"
	       "alexandria"
	       "anaphora"
	       "antik"
	       "gsll"
	       "numeric-table"
	       "mv-gnuplot"
	       "cl-csv")
  :components
  ((:module "init"
	    :serial t
	    :pathname #P"./"
	    :components
	    ((:file "tds-scope-traces-package-def")
	     (:file "tds-base-class")))
   (:module "scope-definitions"
	    :serial t
	    :pathname #P"./"
	    :components
	    ((:file "tds-3034")
	     (:file "tds-360")
	     (:file "extra")))))

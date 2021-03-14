;; The Common Lisp Object System (CLOS) is pretty unique

(defclass dog ()
  ((name
    :initarg :name
    :accessor name)

   (bark
    :initform nil
    :accessor bark)
   ))

(defvar dog1 (make-instance `dog :name "john"))

(name dog1)

(bark dog1)

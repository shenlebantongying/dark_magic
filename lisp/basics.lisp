;; What i think maybe the basic of Lisp
;; Lets gain some momentum for commonlisp

;; Quote
(quote (+ 1 2))
'(quote nice)

(mapcar #'1+ '(1 2 3)) ;; => (2 3 4)

;; #' is called "Sharpsign Single-Quote"
;; http://www.lispworks.com/documentation/HyperSpec/Body/02_dh.htm

;; Below two are equivalent
(apply #'+ 1)
(apply (function +)  1)

(loop :for x :across "abcd" :collect x) ;; => (#\a #\b #\c #\d)

;; A bit difference between cons and list
(cdr (cons '(1 2 3) '(4 5 6))) ;; => (1 2 3)
(cdr (cons '(1 2 3) '(4 5 6))) ;; => (4 5 6)

;; A more magical example
(cdr (last '(1 2 3))) ;; => NIL
;; HOW?
(cdr '(1 2 3))  ;; =>(2 3)
(last '(1 2 3)) ;; =>(3)

(cdr '(1)) ;; => NIL!

;; We can use the above to define a Circular list
(setf *print-circle* t)

(defun mycircular! (iList)
  (setf (cdr (last iList)) iList))

(mycircular! (list 1 2 3))
;; => #1=(1 2 3 . #1#)

(fifth (mycircular! (list 1 2 3))) 
;; in SBCL => 2 (2 bits, #x2, #o2, #b10)

;; Simple currying in Lisp
;; &rest means "Variable number of arguments"
(defun curry (function_placeholder &rest args)
  (lambda (&rest more-args)
	  (apply function_placeholder (append args more-args))))

(funcall (curry #'+ 3) 5) ;; => 8

;; Some fun with the type system!
;; WTF? Yes, lisp has a rigid type system too.
(defvar *aVar* 1.2)
(type-of *aVar*)  ;; => SINGLE-FLOAT
(class-of *aVar*) ;; => <BUILT-IN-CLASS COMMON-LISP:SINGLE-FLOAT>
(describe 'SINGLE-FLOAT)
;; COMMON-LISP:SINGLE-FLOAT
;; [symbol]

;; SINGLE-FLOAT names the built-in-class #<BUILT-IN-CLASS COMMON-LISP:SINGLE-FLOAT>:
;; Class precedence-list: SINGLE-FLOAT, FLOAT, REAL, NUMBER, T
;; Direct superclasses: FLOAT
;; No subclasses.
;; Sealed.
;; No direct slots.

;; SINGLE-FLOAT names a primitive type-specifier:
;; Lambda-list: (&OPTIONAL (SB-KERNEL::LOW '*) (SB-KERNEL::HIGH '*))
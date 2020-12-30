;; Tested on Chez Scheme


;; TODO read <https://ds26gte.github.io/tyscheme/index-Z-H-15.html>

;; =================================
;; Syntactic Extension

;; let is nothing special
;; (let ((var expr) ...) body1 body2 ...)
;; is equivalent to
;; ((lambda (var ...) body1 body2 ...)
;;  expr ...)

(define-syntax mylet
  (syntax-rules ()
    [(_ ((x e) ...) b1 b2 ...)
     ((lambda (x ...) b1 b2 ...) e ...)]))

(mylet ([x 1] [y 2]) (+ x y)) ;; => 3

;; =================================
;; Implementions of Higher-Order Functions

(define [mymap f l]
  (if (null? l)
      '()
      (cons [f (car l)] [mymap f (cdr l)])))

(mymap [lambda (x) (+ x x)] '(1 2 3)) ;; => (2 4 6)

;; =================================
;; Continuation-passing style

;; Example 2*3 + 1
;; Normally
(+ (* 2 3))

;; CPS
;; Define CPS version of the functions

(define (cps+ x y c)
  (c (+ x y)))

(define (cps* x y c)
  (c (* x y)))

(define (cps_output x) x)

(cps* 2 3 (lambda (x) (+ x 1))) ;; => 7

;; example 1*2 + 3*4

(cps* 1 2 [lambda (m12) (cps* 3 4 [lambda (m34) (+ m12 m34)])]) ;; =>14

;; Execution:
;; compute (+ 1 2)
;; pass the result to m12 in [lambda (m12) (cps* 3 4 (lambda (m34) (+ m12 m34)))]
;; compute (+ 3 4)
;; pass the result to m34 in [lambda (m34) (+ m12 m34)]
;; return the (+ m12 m34) => 14

;;================================
;; call/cc

;; `continuation` of (+ 1 (+ 2 3)) is

(lambda (f) (+ 1 f))

;; (+1 (+ 2 3)) is equal to

(+ 1 (call/cc
      (lambda (cont) (cont (+ 2 3))))) ;; => 6


(define list-product
  (lambda (s)
    (let recur ((s s))
      (if (null? s) 1
          (* (car s) (recur (cdr s)))))))

(list-product '(2 3 4)) ;; => 24





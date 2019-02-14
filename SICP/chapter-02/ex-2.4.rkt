#lang sicp

; cons-v2 return a procedure which accept a procedure as a parameter
(define (cons-v2 x y)
  (lambda (m) (m x y)))

; car-v2 accept cons-v2 as a parameter
; return a procedure apply to (lambda (p q) p)
; accept x y as parameters
(define (car-v2 z)
  (z (lambda (p q) p)))

(define (cdr-v2 z)
  (z (lambda (p q) q)))

(define x (cons-v2 0 1))
(car-v2 x)
(cdr-v2 x)

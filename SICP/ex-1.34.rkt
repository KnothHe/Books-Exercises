#lang sicp

(define (f g)
  (g 2))

(define (square n) (* n n))

(f square)

(f (lambda (z) (* z (+ z 1))))

; in (f g), g need be a procudure can apply to a number
; not a procedure apply to procedure
; my compiler give me this:
; expected a procedure that can be applied to arguments
(f f)

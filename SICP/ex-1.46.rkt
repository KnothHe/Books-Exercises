#lang sicp

(define (average x y)
  (/ (+ x y) 2))
(define (square x) (* x x))

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess)
    (iter guess)))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

; test
(sqrt 4)

(define tolerance 0.00001)

(define (fixed-point-original f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (fixed-point f first-guess)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve good-enough? f) first-guess))

; test
(fixed-point-original cos 1.0)
(fixed-point cos 1.0)

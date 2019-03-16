#lang sicp

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (improve guess) guess))
       (* guess 0.001)))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (average a b)
    (/ (+ a b) 2))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

; test case
(sqrt 4)
(sqrt 16)
(sqrt 10000)
(sqrt 0.01)

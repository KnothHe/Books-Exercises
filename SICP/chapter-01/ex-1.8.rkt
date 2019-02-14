#lang sicp

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root-iter (improve guess x)
                       x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (* guess 0.001)))

(define (square x) (* x x))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))

; test cases
(cubic-root 0.001)
(cubic-root 1000)

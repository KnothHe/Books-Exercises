#lang sicp

(define (square x) (* x x))

(define (sumOfSquares x y)
  (+ (square x)
     (square y)))

(define (sqSumOfLargest a b c)
  (cond ((and (>= a c) (>= b c)) (sumOfSquares a b))
        ((and (>= a b) (>= c b)) (sumOfSquares a c))
        ((and (>= b a) (>= c a)) (sumOfSquares b c))))


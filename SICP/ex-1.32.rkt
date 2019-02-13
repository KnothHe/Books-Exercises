#lang sicp

; definition of accumulte
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

; definition of sum via accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

; definition of product via accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))

; test
(define (sum-integers a b)
  (define (term n) n)
  (define (next n) (+ n 1))
  (sum term a next b))

(sum-integers 1 10)

(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (if (<= n 0)
      1
      (product term 1 next n)))

(factorial 3)
(factorial 4)

;iteration
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (sum-integers-iter a b)
  (define (term n) n)
  (define (next n) (+ n 1))
  (sum-iter term a next b))

(sum-integers-iter 1 10)

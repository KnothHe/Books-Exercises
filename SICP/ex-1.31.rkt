#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (if (<= n 0)
      1
  (product term 1 next n)))

(factorial 3)
(factorial 4)
(factorial 5)

(define (even? n)
  (= (remainder n 2) 0))

(define (calculate-pi n)
  (define (term x)
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (define (next x) (+ x 1))
  (* 4.0 (product term 1 next n)))

(calculate-pi 1000)

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result a))))
  (iter a 1))

(define (factorial-iter n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (if (<= n 0)
      1
      (product-iter term 1 next n)))

(factorial-iter 3)
(factorial-iter 4)
(factorial-iter 5)

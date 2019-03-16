#lang sicp

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-counter)
  (if (> counter max-counter)
      product
      (fact-iter (* product counter) (+ counter 1) max-counter)))

(define (factorial2 n)
  (define (fact-iter product counter)
    (if (> counter n)
        product
        (fact-iter (* product counter)
                   (+ counter 1))))
  (fact-iter 1 1))

; test case
(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)
(factorial 6)

(factorial2 2)
(factorial2 3)
(factorial2 4)
(factorial2 5)
(factorial2 6)

#lang sicp

; definition of filtered-accumulte
(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter? a)
          (combiner (term a)
                    (filtered-accumulate filter? combiner null-value term (next a) next b))
          (combiner null-value
                    (filtered-accumulate filter? combiner null-value term (next a) next b)))))

; definiton of prime?
(define (square n) (* n n))
(define (even? n)
  (= (remainder n 2) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; a)
(define (sum-primes a b)
  (define (term n) n)
  (define (next n) (+ n 1))
  (filtered-accumulate prime? + 0 term a next b))

; 1 2 3 5 7 = 18
(sum-primes 1 7)

(define (gcd-product n)
  (define (filter? x)
    (= (gcd n x) 1))
  (define (next x) (+ x 1))
  (define (term n) n)
  (filtered-accumulate filter? * 1 term 1 next n))

; 1 3 7 9 = 189
; (* 1 3 7 9)
(gcd-product 10)

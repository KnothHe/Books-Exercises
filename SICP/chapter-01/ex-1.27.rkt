#lang sicp

(define (square n) (* n n))
(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ (random (- n 1)) 1)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 100))

(define (carm n)
  (define (iter counter)
    (fermat-test n)
    (if (> counter n)
        true
        (iter (+ counter 1))))
  (iter 0))

(carm 561)
(carm 1105)
(carm 2465)
(carm 2821)
(carm 6601)

#lang sicp

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

; code of exercise 1.22
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start-number end-number)
  (define (search n)
    (if (> n end-number)
        (and (newline)
             (display "*** End ***"))
        (and (timed-prime-test n) (search (+ n 2)))))
  (if (even? start-number)
      (search (+ start-number 1))
      (search start-number)))

(search-for-primes 1000 1015)
(search-for-primes 10000 10015)
(search-for-primes 100000 100015)

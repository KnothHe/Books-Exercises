#lang sicp

(define (get-number n divisor)
  (define (iter try-expt)
    (if (= (remainder n (expt divisor try-expt)) 0)
        (iter (+ try-expt 1))
        (- try-expt 1)))
  (iter 1))

(define (cons-v2 x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (car-v2 x)
  (get-number x 2))

(define (cdr-v2 x)
  (get-number x 3))

; test
(define x (cons-v2 4 5))
(car-v2 x)
(cdr-v2 x)


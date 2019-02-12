#lang sicp

(define (even? n)
  (= (remainder n 2) 0))
(define (square n)
  (* n n))

(define (fib n)
  (fib-iter 1 0 0 1 n))

; a <- b*q + a*q + a*p
; b <- b*p + a*q
; p' = p^2 + q^2
; q' = q^2 + 2*p*q
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (square q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
(fib 9)
(fib 10)
(fib 100)

#lang sicp

; b^n = (b^{n/2})^2, n is even
; b^n = b*b^{n-1}, n is odd
; b^0 = 1
; use (b^{n/2})^2 = (b^2)^{n/2}
; keep the product a*b^n constant
(define (fast-expt b n)
  (define (iter b counter product)
    (cond ((= counter 0) product)
          ((even? counter)
           (iter (square b) (/ counter 2) product))
          (else (iter b (- counter 1) (* b product)))))
  (iter b n 1))

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 4)

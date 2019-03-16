#lang sicp

; b^n = b*b^{n-1}
; b^0 = 1
(define (expt-recursive b n)
  (if (= n 0)
      1
      (* b (expt-recursive b (- n 1)))))

(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
      b
      (expt-iter b
                 (- counter 1)
                 (* product b))))

; b^n = (b^{n/2})^2, n is even
; b^n = b*b^{n-1}, n is odd
; b^0 = 1
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt (- n 1))))))

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

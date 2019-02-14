#lang sicp

(define (square n) (* n n))
(define (even? n)
  (= (remainder n 2) 0))

; b^n = (b^{n/2})^2, n is even
; b^n = b*b^{n-1}, n is odd
; b^0 = 1
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

;; (define (expmod base exp m)
;;   (cond ((= exp 0) 1)
;;         ((even? exp)
;;          (remainder (square (expmod base (/ exp 2) m))
;;                     m))
;;         (else
;;          (remainder (* base (expmod base (- exp 1) m))
;;                     m))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; not good
; When the base and the power are high,
; the computer storage requires more space,
; and the calculation takes a long time.

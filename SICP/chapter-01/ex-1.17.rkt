#lang sicp

;; (define (product a b)
;;   (if (= b 0)
;;       0
;;       (+ a (product a (- b 1)))))

(define (double n) (* n 2))
(define (havle n) (/ n 2))
(define (even? n) (= (remainder n 2) 0))

; a * b = 2*a * b/2, b is even
; a * b = a + a * (b - 1), b is odd
; a * 0 = 0
(define (product a b)
  (cond ((= b 0) 0)
        ((even? b) (product (double a) (havle b)))
        (else (+ a (product a (- b 1))))))

(product 2 4)
(product 3 4)
(product 3 5)

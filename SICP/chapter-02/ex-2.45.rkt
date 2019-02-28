#lang sicp
(#%require sicp-pict)

;; original right-split
;; (define (right-split painter n)
;;   (if (= n 0)
;;       painter
;;       (let ((smaller (right-split painter (- n 1))))
;;         (beside painter (below smaller smaller)))))

;; split
(define (split op1 op2)
  (define (lambda-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (lambda-split painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  lambda-split)

;; right-split and up-split
(define right-split (split beside below))
(define up-split (split below beside))

;; test
(paint (right-split diagonal-shading 4))
(paint (up-split diagonal-shading 4))

#lang sicp

(define (fringe x)
  (define (build-fringe items result)
    (cond ((null? items) result)
          ((not (pair? items)) (cons items result))
          (else (build-fringe (car items)
                              (build-fringe (cdr items)
                                            result)))))
  (build-fringe x nil))

(define x (list (list 1 2) (list 3 4)))
(display (fringe x))
(newline)
(display (fringe (list x x)))

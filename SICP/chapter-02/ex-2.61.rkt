#lang sicp

(define (adjoin-set x set)
  (cond ((or (null? set) (< x (car set))) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define set1 (list 1 2 3 5))
(display (adjoin-set 4 set1))
(newline)

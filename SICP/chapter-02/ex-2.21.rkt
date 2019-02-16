#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-v2 items)
  (map square items))

(newline)
(display (square-list (list 1 2 3 4)))
(newline)
(display (square-list-v2 (list 1 2 3 4)))

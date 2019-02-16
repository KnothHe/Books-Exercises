#lang sicp

(define (reverse-v2 items)
  (define (iter result the-rest)
    (if (null? the-rest)
        result
        (iter (cons (car the-rest) result) (cdr the-rest))))
  (iter nil items))

(display (reverse-v2 (list 1 4 9 16 25)))

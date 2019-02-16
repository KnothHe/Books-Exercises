#lang sicp

(define (same-parity x . z)
  (define (iter result the-rest)
    (cond ((null? the-rest)
           (reverse result))
          ((and (even? x) (even? (car the-rest)))
           (iter (cons (car the-rest) result) (cdr the-rest)))
          ((and (odd? x) (odd? (car the-rest)))
           (iter (cons (car the-rest) result) (cdr the-rest)))
          (else (iter result (cdr the-rest)))))
  (iter (list x) z))


(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))


#lang sicp

(define (for-each-v2 proc items)
  (define (iter its)
    (if (null? its)
        #t
        (and (proc (car its))
             (iter (cdr its)))))
  (iter items))

(for-each-v2 (lambda (x) (newline) (display x))
             (list 57 321 88))


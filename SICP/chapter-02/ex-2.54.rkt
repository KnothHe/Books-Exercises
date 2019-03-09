#lang sicp

(define (equal? list1 list2)
  (cond ((and (pair? list1) (pair? list2))
         (and (equal? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        ((and (null? list1) (null? list2))
         #t)
        ((or (and (null? list1) (not (null? list2)))
             (and (null? list2) (not (null? list1))))
         #f)
        (else (eq? list1 list2))))

(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))
(equal? '((this is) (a list)) '((this is) (a list)))
(equal? '((this is) (a list)) '((this is) a list))
(equal? '(this is (a list)) '(this is (a list)))

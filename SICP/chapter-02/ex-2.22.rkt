#lang sicp

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square-list-v2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list (list 1 2 3 4))
; result
; (mcons 16 (mcons 9 (mcons 4 (mcons 1 '()))))
; obviously
(square-list-v2 (list 1 2 3 4))
; result
; (mcons (mcons (mcons (mcons '() 1) 4) 9) 16)
; first answer is nil
; then process the first parameter in the list,
; which is 1
; then (cons nil 1)
; then (cons (nil 1) 2)
; then (cons ((nil 1) 2) 3) ...

#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2))
         '())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (if (null? set1)
      set2
      (cons (car set1)
            (union-set (cdr set1) set2))))

;; Test
(define set1 (list 1 2 3 4))
(define set2 (list 3 4 5 6))
(display (adjoin-set 5 set1))
(newline)
(display (intersection-set set1 set2))
(newline)
(display (union-set set1 set2))

;; when we need a lot of union operation, it would be better to use this representation


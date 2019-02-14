#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (x) (f x)))
(define two (lambda (x) (f (f x))))

(define (add a b)
  (lambda (x)
    ((a f) (b f) x)))


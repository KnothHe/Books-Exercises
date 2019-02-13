#lang sicp

(define (average a b)
  (/ (+ a b) 2.0))
(define (square x) (* x x))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeated f (- n 1)))))

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

; I guess this is right :P
; repeat log_{2}n times
(sqrt 4)
(define (root-n x n)
  (fixed-point ((repeated average-damp
                         (floor (/ (log n)
                                   (log 2))))
                (lambda (y) (/ x (expt y (- n 1)))))
               1.0))

(root-n 4 2)
(root-n 8 3)
(root-n 16 4)
(root-n 32 5)
(root-n 64 6)
(root-n 128 7)
(root-n 256 8)
(root-n 512 9)
(root-n 1024 10)

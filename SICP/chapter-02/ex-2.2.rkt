#lang sicp

; point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; segment
(define (make-segment start-p end-p)
  (cons start-p end-p))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; print point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; definition of midpoint-segment
(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))

(define (average x y)
  (/ (+ x y) 2.0))

; test
(define one-two (make-point 1 2))
(define three-five (make-point 3 5))
(define s (make-segment one-two three-five))
(print-point (midpoint-segment s))

#lang sicp

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percent)
  (let ((width (* center (/ percent 100.0))))
    (make-center-width center width)))

(define (percent x)
  (* (/ (width x) (center x)) 100))

(define x (make-center-percent 10 50))
(lower-bound x)
(upper-bound x)
(center x)
(width  x)
(percent x)

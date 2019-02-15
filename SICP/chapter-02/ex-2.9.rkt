#lang sicp

(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

; for add-interval and sub-interval
; just see add-interval
; x := (a, b), a <= b
; y := (c, d), c <= d
; x + y = (a+c, b+d)
; length of x + y is ((b+d) - (a+c))/2 = (b-a)/2 + (d-c)/2
; equals length of x plus length of y

; for mul-interval and div-interval
; just see mul-interval
; x := (-1, 2)
; y := (1, 2)
; x * y = (-2, 4)
; length of x * y is (4 - (-2))/2 = 3
; length of x is 3/2 = 1.5
; length of y is 1/2 = 0.5
; length of x times length of y is 1.5 * 0.5 = 0.75
; not equals lenght of x times length of y

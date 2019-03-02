#lang sicp

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

;; vect1 : (x1, y1)
;; vect2 : (x2, y2)
;; (add-vect vect1 vect2): (x1 + x2, y1 + y2)
(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1)
                (xcor-vect vect2))
             (+ (ycor-vect vect1)
                (ycor-vect vect2))))

;; (sub-vect vect1 vect2) : (x1 - x2, y1 - y2)
(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1)
                (xcor-vect vect2))
             (- (ycor-vect vect1)
                (ycor-vect vect2))))

;; s : s
;; vect : (x, y)
;; (scale-vect s vect) : (s*x, s*y)
(define (scale-vect s vect)
  (make-vect (* s
                (xcor-vect vect))
             (* s
                (ycor-vect vect))))

(define vect1 (make-vect 1 2))
(define vect2 (make-vect 3 4))
(add-vect vect1 vect2)
(sub-vect vect1 vect2)
(scale-vect 2 vect1)

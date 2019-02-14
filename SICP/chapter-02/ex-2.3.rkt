#lang sicp

; point
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; print point
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; version 1
(define (make-rectangle first-point second-point)
  (cons first-point second-point))

(define (first-point-rectangle rec)
  (car rec))
(define (second-point-rectangle rec)
  (cdr rec))
(define (width-rectangle rec)
  (abs (- (x-point (first-point-rectangle rec))
          (x-point (second-point-rectangle rec)))))
(define (height-rectangle rec)
  (abs (- (y-point (first-point-rectangle rec))
          (y-point (second-point-rectangle rec)))))

(define (perimeter-rectangle rec)
  (* (+ (width-rectangle rec)
        (height-rectangle rec))
     2))

(define (area-rectangle rec)
  (* (width-rectangle rec)
     (height-rectangle rec)))

; test
(define fp (make-point 0 0))
(define sp (make-point 2 3))
(define rec (make-rectangle fp sp))
(newline)
(display (perimeter-rectangle rec))
(newline)
(display (area-rectangle rec))

; version 2
(define (make-rec top-left-rec width height)
  (cons top-left-rec (cons width height)))

(define (top-left-rec rec)
  (car rec))
(define (width-rec rec)
  (car (cdr rec)))
(define (height-rec rec)
  (cdr (cdr rec)))

(define (perimeter-rec rec)
  (* (+ (width-rec rec)
        (height-rec rec))
     2))

(define (area-rec rec)
  (* (width-rec rec)
     (height-rec rec)))

; test
(define p (make-point 0 0))
(define rec-v2 (make-rec p 2 3))
(newline)
(display (perimeter-rec rec-v2))
(newline)
(display (area-rec rec-v2))

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
(define (make-rectangle top-left-p bottom-right-p)
  (cons top-left-p bottom-right-p))

(define (top-left-rectangle rec)
  (car rec))
(define (bottom-right-rectangle rec)
  (cdr rec))

(define (perimeter-rectangle rec)
  (* (+ (abs (- (x-point (top-left-rectangle rec))
                (x-point (bottom-right-rectangle rec))))
        (abs (- (y-point (top-left-rectangle rec))
                (y-point (bottom-right-rectangle rec)))))
     2))

(define (area-rectangle rec)
  (* (abs (- (x-point (top-left-rectangle rec))
             (x-point (bottom-right-rectangle rec))))
     (abs (- (y-point (top-left-rectangle rec))
             (y-point (bottom-right-rectangle rec))))))

; test
(define sp (make-point 0 0))
(define ep (make-point 2 3))
(define rec (make-rectangle sp ep))
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

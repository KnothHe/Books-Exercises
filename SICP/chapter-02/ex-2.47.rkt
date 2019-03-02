#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(define frame (make-frame 1 2 3))
(origin-frame frame)
(edge1-frame frame)
(edge2-frame frame)

;; version 2
(define (make-frame-v2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-v2 frame)
  (car frame))

(define (edge1-frame-v2 frame)
  (car (cdr frame)))

(define (edge2-frame-v2 frame)
  (car (cdr (cdr frame))))

(define frame-v2 (make-frame-v2 1 2 3))
(origin-frame-v2 frame)
(edge1-frame-v2 frame)
(edge2-frame-v2 frame)

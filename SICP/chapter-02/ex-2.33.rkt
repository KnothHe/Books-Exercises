#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; map
(define (map-v2 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (square x) (* x x))
(map-v2 square (list 1 2 3 4))

;; append
(define (append-v2 seq1 seq2)
  (accumulate cons seq2 seq1))

(append-v2 (list 1 2 3) (list 4 5 6))

;; length
(define (length-v2 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(length-v2 (list 1 2 3 4))


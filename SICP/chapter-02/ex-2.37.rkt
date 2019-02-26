#lang sicp

;; definition of accumulate and accumulate-n
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (first-element seqs))
            (accumulate-n op init (the-rest-element seqs)))))

(define (first-element seq)
  (accumulate (lambda (head the-rest)
                (cons (car head) the-rest))
              nil
              seq))

(define (the-rest-element seq)
  (accumulate (lambda (head the-rest)
                (cons (cdr head) the-rest))
              nil
              seq))

;; dot-product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; matrix-*-vector
(define (matrix-*-vector m v)
  (map (lambda (w)
         (dot-product w v))
       m))

;; transpose
(define (transpose mat)
  (accumulate-n cons nil mat))

;; matrix-*-matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (w)
           (matrix-*-vector m w))
         cols)))

;; test
(define v (list 1 2 3 4))
(define w (list 5 6 7 8))
(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define matrix-2 (list (list 9 6 3 1) (list 1 2 3 4) (list 4 5 6 6) (list 7 8 9 0)))

;; 1*5 + 2*6 + 3*7 + 4*8
;; 5 + 12 + 21 + 32
;; 70
(dot-product v w)
;; [[1 2 3 4] [4 5 6 6] [6 7 8 9]] * [1 2 3 4]
;; [1 2 3 4] * [1 2 3 4]
;; 1*1 + 2*2 + 3*3 + 4*4
;; 1 + 4 + 9 + 16
;; 30
(display (matrix-*-vector matrix v))
(newline)

(display matrix)
(newline)
(display (transpose matrix))
(newline)

;; python
;; import numpy as np
;; matrix1 = np.mat('[1 ,2, 3,4];[4,5,6,6];[6,7,8,9]')
;; matrix2 = np.mat('[9, 6, 3,1];[1, 2, 3,4]; [4,5, 6,6]; [7, 8, 9, 0]')
;; matrix1 * matrix2
;; result:
;; [[ 51,  57,  63,  27],
;;  [107, 112, 117,  60],
;;  [156, 162, 168,  82]]
(display (matrix-*-matrix matrix matrix-2))
(newline)


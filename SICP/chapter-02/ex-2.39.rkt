#lang sicp

;; definition of fold-left and fold-right
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;; different direction
;; (define (fold-right op initial sequence)
;;   (define (iter result rest)
;;     (if (null? rest)
;;         result
;;         (iter (op (car rest) result)
;;               (cdr rest))))
;;   (iter initial sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

;; definition of reverse via fold-right
(define (reverse-foldr sequence)
  (fold-right (lambda (x y)
                (append y (list x)))
              nil
              sequence))

;; definition of reverse via fold-left
(define (reverse-foldl sequence)
  (fold-left (lambda (x y)
                (cons y x))
              nil
              sequence))

(display (reverse-foldr (list 1 2 3 4)))
(newline)
(display (reverse-foldl (list 1 2 3 4)))
(newline)

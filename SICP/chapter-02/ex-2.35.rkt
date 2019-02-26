#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (node)
                     (cond ((null? node) 0)
                           ((not (pair? node)) 1)
                           (else (count-leaves node))))
                   t)))

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))
(count-leaves (list 1 2 nil (list 3 4) nil))

;; refernece scheme wiki

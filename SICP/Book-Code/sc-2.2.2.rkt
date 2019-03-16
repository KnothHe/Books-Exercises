#lang sicp

(define x (cons (list 1 2) (list 3 4)))

(length x)

(display (list x x))
(newline)

(length (list x x))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves x)

;; tree
(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(display (scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
            10))

(define (scale-tree-map tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree-map sub-tree factor)
             (* sub-tree factor)))
       tree))

(newline)
(display (scale-tree-map (list 1 (list 2 (list 3 4) 5) (list 6 7))
                     10))

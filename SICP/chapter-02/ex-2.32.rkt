#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (cons (car s)
                                  x))
                          rest)))))

;; A subset of a set s can be defined as a combination of its (cdr s) subset and
;; a combination of (car s) and (cdr s) subsets

(define set (list 1 2 3))
(display (subsets set))

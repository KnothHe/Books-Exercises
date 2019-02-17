#lang sicp

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse items)
  (define (deep-reverse-if-required item)
    (if (pair? item)
        (deep-reverse item)
        item))
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items)
              (cons (deep-reverse-if-required (car items))
                    result))))
  (iter items nil))

(display (deep-reverse x))

;; (define list1 (list (list 1 2 3) 4 (list 5 6 7)))
;; (newline)
;; (display list1)
;; (newline)
;; (display (deep-reverse list1))

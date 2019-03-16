#lang sicp

(define one-through-four (list 1 2 3 4))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(list-ref one-through-four 0)
(list-ref one-through-four 1)
(list-ref one-through-four 2)
(list-ref one-through-four 3)

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(length one-through-four)

(define (length-iter items)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a) (+ 1 count))))
  (iter items 0))

(length-iter one-through-four)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define squares (list 1 4 9 16 25))
(define odds (list 1 3 5 7))

(display (append squares odds))

(define (scale-list items factor)
  (if (null? items)
      nil
      (cons (* (car items) factor)
            (scale-list (cdr items) factor))))

(newline)
(display (scale-list (list 1 2 3 4 5) 10))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(newline)
(display (map abs (list -10 2.5 -11.6 17)))
(newline)
(display (map (lambda (x) (* x x)) (list 1 2 3 4)))

(define (scale-list-v2 items factor)
  (map (lambda (x) (* x factor))
       items))

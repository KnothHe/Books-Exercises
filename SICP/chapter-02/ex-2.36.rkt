#lang sicp

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

(define seq (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;; (display (first-element seq))
;; (newline)
;; (display (the-rest-element seq))
;; (newline)
(display (accumulate-n + 0 seq))

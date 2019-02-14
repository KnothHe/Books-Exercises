#lang sicp

(define (cube n)
  (* n n n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(display "Orignal integral: ")
(newline)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x 1.0))
  (define (term k) (f (+ a (* k h))))
  (define (sum counter constant)
      (cond ((> counter n) 0)
            ((or (= counter 0)
                 (= counter n))
             (+ (term counter)
                (sum (next counter) 1)))
            ((or (= constant 1)
                 (= constant 2))
             (+ (* 4 (term counter))
                (sum (next counter) 4)))
            (else
             (+ (* 2 (term counter))
                (sum (next counter) 2)))))
  (* (/ h 3.0)
     (sum 0 1)))

(display "Simpson integral: ")
(newline)
(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)

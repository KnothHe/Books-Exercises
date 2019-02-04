#lang sicp

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iteration n)
  (define (f-iter a b c count)
    (if (= 0 count)
        c
        (f-iter (+ a
                   (* 2 b)
                   (* 3 c))
                a
                b
                (- count 1))))
  (f-iter 2 1 0 n))

; test cases

(f-recursive 10)
(f-iteration 10)

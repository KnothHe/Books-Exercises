#lang sicp

(define (plus-recursive a b)
  (if (= a 0)
      b
      (inc (plus-recursive (dec a) b))))

(define (plus-iteration a b)
  (if (= a 0)
      b
      (plus-iteration (dec a) (inc b))))

; just use + represent plus-recursive and plus-iteration
; when description

(plus-recursive 4 5)
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9

(plus-iteration 4 5)
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9

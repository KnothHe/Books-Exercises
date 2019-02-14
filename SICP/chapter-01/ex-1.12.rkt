#lang sicp

(define (pascal-triangle row col)
  (if (or (= col 1) (= col row))
      1
      (+ (pascal-triangle (- row 1) (- col 1))
         (pascal-triangle (- row 1) col))))

; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1

; test cases
(pascal-triangle 1 1)
(pascal-triangle 2 1)
(pascal-triangle 3 2)
(pascal-triangle 4 3)
(pascal-triangle 5 3)

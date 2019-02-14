#lang sicp

; sin(x) = 3*sin(x/3) - 4*sin(x/3)^3
(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a)
(sine 12.15)
; (sine 12.15) => [(p (sine (/ 12.15 3.0)))] => (p (sine 4.05))
; (sine 4.05)  => [(p (sine (/ 4.05 3.0))) ] => (p (sine 1.35))
; (sine 1.35)  => [(p (sine (/ 1.35 3.0))) ] => (p (sine 0.45))
; (sine 0.45)  => [(p (sine (/ 0.45 3.0))) ] => (p (sine 0.15))
; (sine 0.15)  => [(p (sine (/ 0.15 3.0))) ] => (p (sine 0.05))
; finally
; (p (p (p (p (p 0.05)))))
; 5 times in total

; b)
; according to scheme wiki
; time and space are both
; ⌈log_{3}{a/0.1}⌉
; (ceiling(/ (log (/ a 0.1)) (log 3)))
; O(logN)

#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess counter)
    (display "guess ")
    (display counter)
    (display ": ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ 1 counter)))))
  (try first-guess 1))

; x |-> log(1000)/log(x)
(define (find-root-v1)
  (fixed-point (lambda (x) (/ (log 1000) (log x)))
               2.71))

; x |-> 1/2(x + log(1000)/log(x))
(define (find-root-v2)
  (fixed-point (lambda (x) (* (+ x (/ (log 1000)
                                      (log x)))
                              0.5))
               2.71))

(find-root-v1)
(find-root-v2)

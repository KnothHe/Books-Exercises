#lang sicp

(define (average a b)
  (/ (+ a b) 2.0))
(define (square x) (* x x))
(define (cube x) (* x x x))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

; definition of cubic
(define (cubic a b c)
  (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(define (cubic-root a b c)
  (newtons-method (cubic a b c) 1))

; (x + 1)^3 = x^3 + 3x^2 + 3x + 1
(cubic-root 3 3 1)

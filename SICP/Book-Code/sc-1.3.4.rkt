#lang sicp

(define (average a b)
  (/ (+ a b) 2.0))

(define (square x) (* x x))

(define (average-damp f)
  (lambda (x) (average x (f x))))

((average-damp square) 10)

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

(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(sqrt 4)

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(cube-root 8)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (cube x) (* x x x))

((deriv cube) 5)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-newton x)
  (newton-method (lambda (y) (- (square y) x))
                  1.0))
(sqrt-newton 4)

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (sqrt-average-damp x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(define (sqrt-newton-transform x)
  (fixed-point-of-transform (lambda (y) (- (square y) x))
                            newton-transform
                            1.0))

(sqrt-average-damp 4)
(sqrt-newton-transform 4)

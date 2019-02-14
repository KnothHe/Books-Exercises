#lang sicp

(define (cont-frac-minus n d k)
  (define (iter counter result)
    (if (= counter 0)
        result
        (iter (- counter 1) (/ (n counter)
                               (+ (d counter)
                                  (- result))))))
  (iter k 0))

(define (square x) (* x x))

(define (tan-cf x k)
  (cont-frac-minus (lambda (i)
                     (if (= i 1)
                         x
                         (square x)))
                     (lambda (i) (- (* 2.0 i) 1))
                     k))

(define (report-test x k)
  (let ((result (tan-cf x k))
        (expected (tan x)))
  (newline)
  (display "number: ")
  (display x)
  (newline)
  (display "result: ")
  (display result)
  (newline)
  (display "expected: ")
  (display expected)))

(report-test (/ 3.14 4) 10)

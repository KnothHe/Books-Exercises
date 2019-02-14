#lang sicp

; definition of cont-frac
; recursive
(define (cont-frac n d k)
  (define (recu counter)
    (if (> counter k)
        0
        (/ (n counter)
           (+ (d counter)
              (recu (+ counter 1))))))
  (recu 1))

; iteration
(define (cont-frac-iter n d k)
  (define (iter counter result)
    (if (= counter 0)
        result
        (iter (- counter 1) (/ (n counter)
                               (+ (d counter)
                                  result)))))
  (iter k 0))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           13)

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                13)

; 1/phi
(/ (- (sqrt 5.0) 1.0) 2.0)


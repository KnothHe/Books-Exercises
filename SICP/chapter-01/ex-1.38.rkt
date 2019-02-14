#lang sicp

(define (cont-frac n d k)
  (define (iter counter result)
    (if (= counter 0)
        result
        (iter (- counter 1) (/ (n counter)
                               (+ (d counter)
                                  result)))))
  (iter k 0))

; D_i =
; (i/3 + 1)*2, if i%3 == 2
; 1
; 1 2 1 1 4 1 1 6 1 1 8 ...
(define (e) (+ 2
               (cont-frac (lambda (i) 1.0)
                          (lambda (i)
                            (if (= (remainder i 3) 2)
                                (* (+ (floor (/ i 3)) 1)
                                   2.0)
                                1.0))
                          10)))

(e)



#lang sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination coins)
  (car coins))

(define (except-first-denomination coins)
  (cdr coins))

(define (no-more? coins)
  (null? coins))

(cc 100 us-coins)

; the order in which the coin-values are arranged does not affect the answer
; given by cc.

; Rptx's answer on scheme wiki:
; For the last part of the exercise. The order of the coins does not affect the
; result. Becuase the procedure computes all possible combinations. But it does
; affect the speed of the computation. If you start with the lower valued coins,
; it'll take much longer.

#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)
; r <-> remainder

; applicative-order evaluation
; (gcd 40 (r 206 40))
; (gcd 40 6)
; (gcd 6 (r 40 6))
; (gcd 6 4)
; (gcd 4 (r 6 4))
; (gcd 4 2)
; (gcd 2 (r 4 2))
; (gcd 2 0)
; 2
; 4 times in total

; normal-order evaluation
; (gcd 40 (r 206 40)) 1
; (gcd (r 206 40) (r 40 (r 206 40))) 2
; (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) 3
; (gcd (r (r 206 40) (r 40 (r 206 40))) (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))) 4
; (gcd (r 6 (r 40 6)) (r (r 40 6) (r 6 (r 40 6)))) 3
; (gcd (r 6 4) (r 4 (r 6 4))) 2
; (gcd 2 (r 4 2)) 1
; (gcd 2 0)
; 2
; I guess ((1+2+3)*2+4) + (5 + 3 + 2 + 1) = 16 + 11 = 27 (Wrong)
; maybe 14 + 4 (scheme wiki)
; I don't know, just see scheme wiki

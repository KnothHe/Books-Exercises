#lang sicp

(define (make-interval a b)
  (if (< a b)
      (cons a b)
      (cons b a)))

(define (lower-bound x)
  (car x))

(define (upper-bound x)
  (cdr x))

;; (define (mul-interval x y)
;;   (let ((p1 (* (lower-bound x) (lower-bound y)))
;;         (p2 (* (lower-bound x) (upper-bound y)))
;;         (p3 (* (upper-bound x) (lower-bound y)))
;;         (p4 (* (upper-bound x) (upper-bound y))))
;;     (make-interval (min p1 p2 p3 p4)
;;                    (max p1 p2 p3 p4))))

; pattern   | min    | max
; ----------------------------
;1. ++|++   | al*bl  | ah*bh
; ----------------------------
;2. ++|-+   | ah*bl  | ah*bh
; ----------------------------
;3. ++|--   | ah*bl  | al*bh
; ----------------------------
;4. -+|++   | al*bh  | ah*bh
; ----------------------------
;5. -+|--   | ah*bl  | al*bl
; ----------------------------
;6. --|++   | al*bh  | ah*bl
; ----------------------------
;7. --|-+   | al*bh  | al*bl
; ----------------------------
;8. --|--   | ah*bh  | al*bl
; ------------------------------

;9. -+|-+   | min(al, bl)*max(ah, bh) | max(al*bl, ah*bh)
;
; -+|-+ include zero in interval


(define (mul-interval x y)
  (let ((al (lower-bound x))
        (ah (upper-bound x))
        (bl (lower-bound y))
        (bh (upper-bound y)))
    (cond ((and (positive? al) (positive? ah) (positive? bl) (positive? bh)) ; 1
           (make-interval (* al bl) (* ah bh)))
          ((and (positive? al) (positive? ah) (negative? bl) (positive? bh)) ; 2
           (make-interval (* ah bl) (* ah bh)))
          ((and (positive? al) (positive? ah) (negative? bl) (negative? bh)) ; 3
           (make-interval (* ah bl) (* al bh)))
          ((and (negative? al) (positive? ah) (positive? bl) (positive? bh)) ; 4
           (make-interval (* al bh) (* ah bh)))
          ((and (negative? al) (positive? ah) (negative? bl) (negative? bh)) ; 5
           (make-interval (* ah bl) (* al bl)))
          ((and (negative? al) (negative? ah) (positive? bl) (positive? bh)) ; 6
           (make-interval (* al bh) (* ah bl)))
          ((and (negative? al) (negative? ah) (negative? bl) (positive? bh)) ; 7
           (make-interval (* al bh) (* al bl)))
          ((and (negative? al) (negative? ah) (negative? bl) (negative? bh)) ; 8
           (make-interval (* ah bh) (* al bl)))
          (else (make-interval (* (min al bl) (max ah bh))                   ; 9
                               (max (* al bl) (* ah bh)))))))
; This is so ugly code


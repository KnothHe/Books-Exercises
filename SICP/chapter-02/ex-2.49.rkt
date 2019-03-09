#lang sicp

(#%require sicp-pict)


(define draw-frame
  (
   (lambda ()
     (let (
           (v1 (make-vect 0 0))
           (v2 (make-vect 0 0.99))
           (v3 (make-vect 0.99 0.99))
           (v4 (make-vect 0.99 0))
           )
       (let (
             (sgm1 (make-segment v1 v2))
             (sgm2 (make-segment v2 v3))
             (sgm3 (make-segment v3 v4))
             (sgm4 (make-segment v4 v1))
             )
         (segments->painter (list sgm1 sgm2 sgm3 sgm4))
         )
       )
     )
   )
  )

;; beacuse my compiler alway give me this error
;; in-list: contract violation
;; expected: list?
;; given: (mcons (segment (vect 0 0) (vect 0 0.99)) (mcons (segment (vect 0 0.99) (vect 0.99 0.99)) (mcons (segment (vect 0.99 0.99) (vect 0.99 0)) (mcons (segment (vect 0.99 0) (vect 0 0)) '()))))
;; when I try to call `(paint draw-frame)`, I finally give up the remaining questions

;; the source of above code is https://www.inchmeal.io/sicp/ch-2/ex-2.49.html

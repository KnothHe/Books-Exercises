#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;; b)
;; WORNG!!!
;; (define (total-weight mobile)
;;   (define (branch? b)
;;     (and (not (null? b)) (not (pair? (car b)))))
;;   (define (branch-weight branch)
;;     (cond ((null? branch) 0)
;;           ((not (pair? branch)) branch)
;;           (branch-weight (branch-structure branch))))
;;   (cond ((null? mobile) 0)
;;         ((branch? mobile) (branch-weight mobile))
;;         (else (+ (total-weight (left-branch mobile))
;;                  (total-weight (right-branch mobile))))))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define b1 (make-branch 1 2))
;; (branch-length b1)
;; (branch-structure b1)
(define b2 (make-branch 3 4))
;; (branch-length b2)
;; (branch-structure b2)
(define m1 (make-mobile b1 b2))
;; (left-branch m1)
;; (right-branch m1)
(total-weight m1)

;; c)
(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (not (pair? mobile))
      true
      (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))))

;; Test
(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define d (make-mobile (make-branch 10 a) (make-branch 12 5)))
;; ;; Looks like: ((10 ((2 3) (2 3))) (12 5))

(balanced? d) ;; #t

;; d)
;; (define (make-mobile left right)
;;   (cons left right))

;; (define (left-branch mobile)
;;   (car mobile))
;; (define (right-branch mobile)
;;   ;; Have to use cdr at this point
;;   (cdr mobile))

;; (define (make-branch length structure)
;;   (cons length structure))

;; (define (branch-length branch)
;;   (car branch))
;; (define (branch-structure branch)
;;   (cdr branch))

;; source: shceme wiki


#lang sicp

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; queens
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;; source: https://wizardbook.wordpress.com/2010/12/03/exercise-2-42/
(define empty-board nil)

(define (adjoin-position row positions)
  (cons row positions))

(define (safe? positions)
  (define board-size (length positions))

  (define (safe-diagonal? positions)
    ; test the position for the newly placed queen
    (define (col-safe? new-row col positions)
      (cond ((> col board-size) true)
            ((= (abs (- new-row (car positions)))
                ; the new qeeen's position is always on column 1
                (abs (- col 1))) false)
            (else (col-safe? new-row (+ col 1) (cdr positions)))))
    ; the new queen's position is always in column 1
    ; so the initial column to check is always 2
    (col-safe? (car positions) 2 (cdr positions)))

  (define (safe-horizontal? positions)
    ; does the new row (car) appear anywhere else?
    (not (member (car positions) (cdr positions))))

  (or (= (length position) 1)  ; 1x1 board
      (and (safe-horizontal? position)
           (safe-diagonal?   position))))

;; test
(display (length (queens 8)))

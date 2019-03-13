#lang sicp

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

;; encode
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; encode symbol
(define (encode-symbol symbol tree)
  (if (or (null? tree) (leaf? tree))
      '()
      (let ((left (left-branch tree))
            (right (right-branch tree)))
        (cond ((element? symbol (symbols left))
               (cons 0
                     (encode-symbol symbol left)))
              ((element? symbol (symbols right))
               (cons 1
                     (encode-symbol symbol right)))
              (else (error "SYMBOL NOT IN THIS TREE" symbol))))))

(define (element? e li)
  (cond ((null? li) false)
        ((eq? e (car li)) true)
        (else (element? e (cdr li)))))

;; sample tree
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(A D A B B B C A))
;; definition of decode
(display (encode sample-message sample-tree))
;; (0 1 1 0 0 1 0 1 0 1 0 1 1 1 0)

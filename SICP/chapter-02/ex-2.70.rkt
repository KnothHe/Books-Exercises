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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (cond ((null? leaf-set) '())
        ((= (length leaf-set) 1) (car leaf-set))
        (else (let ((node (make-code-tree
                           (car leaf-set)
                           (cadr leaf-set))))
                (successive-merge (adjoin-set node
                                              (cddr leaf-set)))))))
;; ex-2.70
(define pairs '((boom 1) (wah 1) (a 2) (get 2) (job 2) (sha 3) (yip 9) (na 16)))
(define message '(get a job
                    sha na na na na na na na na
                    get a job
                    sha na na na na na na na na
                    wah yip yip yip yip yip yip yip yip yip
                    sha boom))

(length (encode message (generate-huffman-tree pairs)))
(* (log 8 2) (length message))
;; 84
;; 108

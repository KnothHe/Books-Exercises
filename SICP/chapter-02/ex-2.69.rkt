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

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

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
        ((= (length leaf-set) 1) leaf-set)
        (else (let ((node (make-code-tree
                           (car leaf-set)
                           (cadr leaf-set))))
                (successive-merge (adjoin-set node
                                              (cddr leaf-set)))))))


(define pairs '((H 1) (G 1) (F 1) (E 1) (D 1) (C 1) (B 3) (A 8)))
(display (generate-huffman-tree pairs))
;; (define leaf-set (make-leaf-set pairs))
;; (define a (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set)) (cddr leaf-set)))
;; (define b (adjoin-set (make-code-tree (car a) (cadr a)) (cddr a)))
;; (define c (adjoin-set (make-code-tree (car b) (cadr b)) (cddr b)))
;; (define d (adjoin-set (make-code-tree (car c) (cadr c)) (cddr c)))
;; (define e (adjoin-set (make-code-tree (car d) (cadr d)) (cddr d)))
;; (define f (adjoin-set (make-code-tree (car e) (cadr e)) (cddr e)))
;; (define g (adjoin-set (make-code-tree (car f) (cadr f)) (cddr f)))
;; (length g)

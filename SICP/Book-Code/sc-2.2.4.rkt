#lang sicp
(#%require sicp-pict)

(define einstein2
  (beside einstein (flip-vert einstein)))

(define einstein4
  (below einstein2 einstein2))

;; (paint einstein2)
;; (paint einstein4)

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define einstein4-v2 (flipped-pairs einstein))
(define diagonal-shading4 (flipped-pairs diagonal-shading))
;; (paint diagonal-shading4)

;; (paint (flipped-pairs einstein))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

;; (paint (right-split einstein 2))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

;; (paint (corner-split diagonal-shading 1))
;; (paint (corner-split diagonal-shading 2))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

;; (paint (square-limit diagonal-shading 4))
;; (paint (square-limit einstein 4))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (flipped-pairs-v2 painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))

(define (square-limit-v2 painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

;; (paint (flipped-pairs-v2 diagonal-shading))
;; (paint (square-limit-v2 diagonal-shading 4))

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

;; vect1 : (x1, y1)
;; vect2 : (x2, y2)
;; (add-vect vect1 vect2): (x1 + x2, y1 + y2)
(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1)
                (xcor-vect vect2))
             (+ (ycor-vect vect1)
                (ycor-vect vect2))))

;; (sub-vect vect1 vect2) : (x1 - x2, y1 - y2)
(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1)
                (xcor-vect vect2))
             (- (ycor-vect vect1)
                (ycor-vect vect2))))

;; s : s
;; vect : (x, y)
;; (scale-vect s vect) : (s*x, s*y)
(define (scale-vect s vect)
  (make-vect (* s
                (xcor-vect vect))
             (* s
                (ycor-vect vect))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;; ((frame-coord-map a-frame) (make-vect 0 0))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment)))
       segment-list))))

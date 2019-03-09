#lang sicp

;; (a b c)
(display (list 'a 'b 'c))
(newline)

;; ((george))
(display (list (list 'george)))
(newline)

;; ((y1 y2))
(display (cdr '((x1 x2) (y1 y2))))
(newline)

;; (y1 y2)
(display (cadr '((x1 x2) (y1 y2))))
(newline)

;; #f
(display (pair? (car '(a short list))))
(newline)

;; #f
(display (memq 'red '((red shoes) (blue socks))))
(newline)

;; (red shoes blue socks)
(display (memq 'red '(red shoes blue socks)))
(newline)

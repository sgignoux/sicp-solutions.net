#lang r5rs

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))




(define (h n) (A 2 n))

(display "(h 1) = ") (display (h 1)) (newline)
(display "(h 2) = ") (display (h 2)) (newline)
(display "(h 3) = ") (display (h 3)) (newline)
(display "(h 4) = ") (display (h 4)) (newline)
(display "(h 5) = ") (display (h 5)) (newline)
(newline)

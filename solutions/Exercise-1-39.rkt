#lang racket

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (sub1 i) (/ (n i) (+ result (d i))))))
  (iter (sub1 k) (/ (n k) (d k))))


(define (tan-cf x k)
  (cont-frac-iter
   (lambda (i) (if (= i 1) x (* x x -1)))
   (lambda (i) (- (* 2.0 i) 1))
   k))


; check result
(define x 1)
(display (tan-cf x 8)) (newline)
(display (tan x)) (newline)

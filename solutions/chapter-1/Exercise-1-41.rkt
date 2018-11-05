#lang racket


(define (inc x) (+ x 1))

(define (double f)
  (lambda (x)
    (f (f x))))

(display ((double inc) 5)) (newline)
(display (((double double) inc) 5)) (newline)
(display ((((double double) double) inc) 5)) (newline)
(display (((double (double double)) inc) 5)) (newline)


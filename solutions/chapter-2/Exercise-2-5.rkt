#lang racket


(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (define (car-iter x count)
  (if (= 0 (remainder x 2))
      (car-iter (/ x 2) (+ 1 count))
      count))
  (car-iter x 0))

(define (cdr x)
  (define (cdr-iter x count)
  (if (= 0 (remainder x 3))
      (cdr-iter (/ x 3) (+ 1 count))
      count))
  (cdr-iter x 0))

(print (cons 3 18))       (newline)
(print (car (cons 3 18))) (newline)
(print (cdr (cons 3 18))) (newline)

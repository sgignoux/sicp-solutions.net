#lang racket
 (require racket/trace)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (add1 x) (+ 1 x))


(define (add  m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define one   (add-1 zero))
(define two   (add-1  one))
(define three (add-1  two))

(print ((zero add1) 0)) (newline)
(print (((add-1 zero) add1) 0)) (newline)
(print (((add-1 (add-1 zero)) add1) 0)) (newline)
(print (((add-1 (add-1 zero)) add1) 0)) (newline)
(print (((add three two) add1) 0)) (newline)
#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* a result))))
  (iter a 1))

(define (identity x) x)

(define (inc n) (+ n 1))

(define (square x) (* x x))

(define (factorial n)
  (product-iter identity 1 inc n))

(display (factorial 42)) (newline)

(define (wallis-product n)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (product term 1.0 inc n))

; pi
(display (* 2 (wallis-product 10000))) (newline)
#lang racket/base
(require racket/trace)

(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(trace mult)
(mult 17 19)

(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (fast-mult (double a) (halve b)))
        (else
         (+ a (fast-mult a (- b 1))))))

(trace fast-mult)
(fast-mult 17 19)
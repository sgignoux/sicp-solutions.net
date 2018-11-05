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

(define (fast-mult-iter a b c)
  (cond ((= b 0)
         c)
        ((even? b)
         (fast-mult-iter (double a) (halve b) c))
        (else
         (fast-mult-iter a (- b 1) (+ c a)))))

(trace fast-mult-iter)
(fast-mult-iter 17 19 0)
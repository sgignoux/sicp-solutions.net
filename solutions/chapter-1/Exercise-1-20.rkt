#lang racket/base
(require racket/trace)

(define (rem a b)
  (remainder a b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (rem a b))))


(trace gcd)
(trace rem)

(gcd 206 40)
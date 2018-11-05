#lang racket
(require racket/trace)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))


(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

; --- Prime computation ---

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))


; --- Solution ---

(define (filtered-accumulate predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a) (term a) null-value)
       (filtered-accumulate predicate? combiner null-value term (next a) next b))))
      

(define (inc n) (+ n 1))

(define (sum-of-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;(trace prime?)

(display (sum-of-squares-prime 1 6)) (newline)



(define (identity x) x)
  
(define (product-of-relative-prime n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))

(display (product-of-relative-prime 9)) (newline)

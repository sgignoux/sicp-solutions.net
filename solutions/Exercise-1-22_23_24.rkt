#lang racket/base
(define (runtime) (current-inexact-milliseconds)) ; adapting to DrRacket

; --- fast-prime? ---

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime?100 n)
  (fast-prime? n 100))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else #f)))

; --- prime? ---

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; --- prime-improved? ---

(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))

(define (find-divisor-improved n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor-improved
               n
               (next test-divisor)))))

(define (smallest-divisor-improved n)
  (find-divisor-improved n 2))

(define (prime-improved? n)
  (= n (smallest-divisor-improved n)))

; --- Timing ---

(define (timed-prime-test n method runs)
  (start-prime-test n (runtime) method runs))

(define (start-prime-test n start-time method runs)
  (method n)
  (if (= runs 0)
      (- (runtime) start-time)
      (start-prime-test n start-time method (- runs 1))))

(define primes-list '(1009
                      1013
                      1019
                      10007
                      10009
                      10037
                      100003
                      100019
                      100043
                      1000003
                      1000033
                      1000037
                      10000019
                      10000079
                      10000103
                      100000007
                      100000037
                      100000039
                      1000000007
                      1000000009
                      1000000021
                      10000000019
                      10000000033
                      10000000061
                      ))

; 1.22: prime?
; 1.23: prime-improved?
; 1.24: fast-prime?

(define runs 1000) ; microsecond

(define (measure-time-for-primes l)
  (display "| ")(display (car l)) (display " | ") (display (timed-prime-test (car l) prime? runs))  (display " | ") (display (timed-prime-test (car l) fast-prime?100 runs)) (display " |")(newline)
  (cond ((null? (cdr l))
         0)
        (else
         (measure-time-for-primes (cdr l)))))

; (trace display-list)

(measure-time-for-primes primes-list)






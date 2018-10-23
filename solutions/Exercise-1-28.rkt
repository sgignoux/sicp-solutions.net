#lang racket


(define (square x) (* x x))

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
    (= (expmod a (- n 1) n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else #f)))

(display (fast-prime? 561  100)) (newline) ; This is a Carmichael number, not a prime number, return should be false
(display (fast-prime? 1009 100)) (newline) ; This is a prime number, should return true
(display (fast-prime? 1000 100)) (newline) ; This is a none prime number, should return false
#lang racket

(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod-checked base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-square-checked (expmod-checked base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod-checked base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (miller-rabin-prime?  n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) 
         (miller-rabin-prime? n (- times 1)))
        (else #f)))

(define (assert-result test-name actual expected)
  (display (if (eq? actual expected) "pass: " "fail: "))
  (display test-name)
  (newline))

;(display (fast-prime? 1 10))    (newline) ; #t  prime number
(assert-result "   2 is prime"      (miller-rabin-prime?    2 10) #t)
(assert-result "1009 is prime"      (miller-rabin-prime? 1009 10) #t)
(assert-result "   4 is not prime"  (miller-rabin-prime?    4 10) #f)
(assert-result "  99 is not prime"  (miller-rabin-prime?   99 10) #f)
(assert-result " 561 is not prime " (miller-rabin-prime?  561 10) #f) ; (Carmichael number)
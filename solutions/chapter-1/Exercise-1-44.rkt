#lang racket


(define dx 0.00001)


(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))


(define (square x) (* x x))

(display ((smooth square) 5)) (newline)


(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


(define (smooth-nth f n)
  ((repeated smooth n) f))


(display ((smooth-nth square 2) 5)) (newline)
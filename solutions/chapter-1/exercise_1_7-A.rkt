#lang r5rs

; Program to generate the tables used in the solution.

(define (square x) (* x x))

(define (good-enough? guess x)
;  (display (square guess)) (newline) (display x)  (newline)(newline)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x nth)
  (display "| ") (display nth) (display " | ") (display guess) (display " | ") (display (improve guess x)) (display " | ") (display (- (square guess) x)) (display " | ")  (newline)
  (if (or (good-enough? guess x) (> nth 30))
      guess
      (sqrt-iter (improve guess x) x (+ nth 1))))

(define (improve guess x)
;  (display "(improve ") (display guess) (display " ") (display x) (display ") -> ") (display (average guess (/ x guess))) (newline)
;  (display "guess = ") (display guess) (display " - (/ x guess)) = ") (display (/ x guess)) (newline)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (sqrt x)
  (newline)
  (display "(sqrt ") (display x) (display ")") (newline)
  (display "| iteration | guess | (improve guess x) |(- (square guess) x) |") (newline)
  (display "| --------- | ----- | ----------------- | ------------------- |") (newline)
  (sqrt-iter 1.0 x 0))

; Testing
;(define value 12345678901234)
(define value 123456789012340)
(define sqrt-value (sqrt value))
 (newline)
(display (square sqrt-value)) (display " - ") (display value)
(newline)
(display "delta: ") (display (- (square sqrt-value) value))

; at some point, the difference between the guess and the improved guess become so small that, if the number is large, the difference become zero

(newline)(newline)
; Test large value
(define large-value 12345678901234)
(define sqrt-large-value (sqrt large-value))
(newline)
(display "sqrt(") (display large-value) (display ") = ") (display sqrt-large-value) (display " - Error: ") (display (- (square sqrt-large-value) large-value))
(newline)

(display "Test small value") (newline)
(define small-value 0.00000000123456)
(define sqrt-small-value (sqrt small-value))
(newline)
(display "sqrt(") (display small-value) (display ") = ") (display sqrt-small-value) (display " - Error: ") (display (- (square sqrt-small-value) small-value))
(newline)
(newline)
(display (sqrt 1234567890123))
(newline)
(display (sqrt 12345678901234))
(newline)
(display (sqrt 12345678901230))
(newline)
(display (sqrt 0.00000000123))
(newline)
(display (square 0.031250013107186406))
(newline)
(display (- (square (sqrt 0.00000000123)) 0.00000000123))
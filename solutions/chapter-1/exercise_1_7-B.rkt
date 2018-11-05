#lang r5rs

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x nth)
  (display nth) (display ": ") (display guess) (display " -> ") (display (square guess))  (newline)
  (if (or (good-enough? guess (improve guess x)) (> nth 32))
      guess
      (sqrt-iter (improve guess x) x (+ nth 1))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x 0))

; Test large value
(define large-value 123456789012345)
(define sqrt-large-value (sqrt large-value))
(newline)
(display "sqrt(") (display large-value) (display ") = ") (display sqrt-large-value) (display " - Error: ") (display (- (square sqrt-large-value) large-value))
(newline)

; Test small value
(define small-value 0.00000000123456)
(define sqrt-small-value (sqrt small-value))
(newline)
(display "sqrt(") (display small-value) (display ") = ") (display sqrt-small-value) (display " - Error: ") (display (- (square sqrt-small-value) small-value))

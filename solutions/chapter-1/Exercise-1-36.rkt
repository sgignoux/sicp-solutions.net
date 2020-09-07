#lang racket

(require racket/trace)

(define tolerance 0.00001)

(define (average a b)
  (/ (+ a b) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; -- no damping --
(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)) (newline)

; -- with damping --
(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)) (newline)

; -- Check --
(newline)
(display (expt 4.555537551999825 4.555537551999825))
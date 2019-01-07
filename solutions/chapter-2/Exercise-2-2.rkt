#lang racket

; --- Points ---
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; --- Segments ---
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (print-segment s)
  (newline)
  (display "[")
  (print-point (start-segment s))
  (display ",")
  (print-point (end-segment s))
  (display "]"))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
              (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))

; --- Test ---

(print-point (make-point 2 3))

(define p1 (make-point 2 3))
(define p2 (make-point 5 6))
(define s1 (make-segment p1 p2))
(print-segment s1)
(print-point (midpoint-segment s1))


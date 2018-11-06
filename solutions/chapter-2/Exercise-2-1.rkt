#lang racket

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

; --- Solution ---

(define (make-rat n d)
  (let ((g (gcd n d))
        (sign (if (> d 0) 1 (- 1))))
    (cons (* (/ n g) sign)
          (* (/ d g) sign))))

; --- Tests ---

(print-rat (make-rat  2 -4))
(print-rat (make-rat -2  4))
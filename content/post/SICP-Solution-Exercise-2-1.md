---
title: "SICP - Solution: Exercise 2.1"
date: 2018-11-05T06:09:58+02:00
draft: false
type: posts
---

## Exercise 2.1

> Define a better version of `make-rat` that handles both positive and negative arguments. `Make-rat` should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.

## Solution

One solution is:

```scheme
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
        (denom-sign (if (> d 0) 1 (- 1))))
    (cons (* (/ n g) denom-sign)
          (* (/ d g) denom-sign))))

; --- Tests ---

(print-rat (make-rat  2 -4))
(print-rat (make-rat -2  4))
```

Which evaluates to:

```
-1/2
-1/2
```

---
title: "SICP - Solution: Exercise 1.40"
date: 2018-10-29T06:03:59+02:00
draft: false
---

**Exercise 1.40:** Define a procedure `cubic` that can be used together with the `newtons-method` procedure in expressions of the form

```
(newtons-method (cubic a b c) 1)
```

to approximate zeros of the cubic ${x^3+ax^2+bx+c}$.

**Solution**

This is direct application of what have been defined before:

```scheme
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


(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) ( * a x x) (* b x) c)))

(define a 1)
(define b 1)
(define c 1)

(display (newtons-method (cubic a b c) 1))
```

The result will be:

```
1
0.33333777776275186
-0.40739341574970156
-1.4188731238603447
-1.1184919351394478
-1.0124818785025846
-1.000153742427375
-1.000000022096024
-0.9999999999997796
```

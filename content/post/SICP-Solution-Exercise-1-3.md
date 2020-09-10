---
title: "SICP - Solution: Exercise 1.3"
date: 2018-09-25T21:03:58+02:00
draft: false
type: posts
---

**Exercise 1.3**

Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

**Solution**

```scheme
; Solution
(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (fun x y z)
  (cond ((and (<= x y) (<= x z)) (sum-square y z))
        ((and (<= y x) (<= y z)) (sum-square x z))
        (else                    (sum-square x y))))

; Checks
(= (fun 10 10 10) (sum-square 10 10))

(= (fun 1 10 10) (sum-square 10 10))
(= (fun 10 1 10) (sum-square 10 10))
(= (fun 10 10 1) (sum-square 10 10))

(= (fun 1 10 100) (sum-square 10 100))
(= (fun 1 100 10) (sum-square 10 100))
(= (fun 10 1 100) (sum-square 10 100))
(= (fun 10 100 1) (sum-square 10 100))
(= (fun 100 10 1) (sum-square 10 100))
(= (fun 100 1 10) (sum-square 10 100))
```

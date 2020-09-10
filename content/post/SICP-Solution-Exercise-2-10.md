---
title: "SICP - Solution: Exercise 2.10"
date: 2019-01-12T07:09:58+02:00
draft: false
type: posts
---

**Exercise 2.10:** Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa’s code to check for this condition and to signal an error if it occurs.

**Solution**

We need to add a check to see if the upper and lower bound of x are with different sign and another one for y:

```scheme
(define (div-interval2 x y)
  (if (or (and (< 0 (lower-bound x)) (> 0 (upper-bound x)))
          (and (> 0 (lower-bound x)) (< 0 (upper-bound x)))
          (and (< 0 (lower-bound y)) (> 0 (upper-bound y)))
          (and (> 0 (lower-bound y)) (< 0 (upper-bound y))))
      (error "One or more interval crossing zero.")
      (mul-interval x
                    (make-interval
                     (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))
```

Testing it:

```scheme
(newline)
(define r3 (make-interval 100.0 101.0))
(define r4 (make-interval 22.0 23.0))

(display "r3=")  (display (width-interval r3)) (newline)
(display "r4=")  (display (width-interval r4)) (newline)
(display "mul=") (display (width-interval (mul-interval r3 r4))) (newline)
(display "div=") (display (width-interval (div-interval2 r3 r4))) (newline)

(define r5 (make-interval 100.0 101.0))
(define r6 (make-interval -0.2 0.3))

(display "r5=")  (display (width-interval r5)) (newline)
(display "r6=")  (display (width-interval r6)) (newline)
(define r7 (div-interval2 r5 r6))
(display "div=") (display (lower-bound r7)) (display ", ") (display (upper-bound r7)) (newline)

```

Displays:

```
r3=0.5
r4=0.5
mul=61.5
div=0.12154150197628466
r5=0.5
r6=0.25
. . One or more interval crossing zero.
```

---
title: "SICP - Solution: Exercise 1.39"
date: 2018-10-29T06:03:58+02:00
draft: false
---

**Exercise 1.39:** A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:

$$\tan\;x=\frac x{1-{\displaystyle\frac{x^2}{3-{\displaystyle\frac{x^2}{5-\cdots}}}}}$$

where `x` is in radians. Define a procedure `(tan-cf x k)` that computes an approximation to the tangent function based on Lambert’s formula. `k` specifies the number of terms to compute, as in Exercise 1.37.

**Solution**

From what we have already done, the solution is done by directly use the function defined:

```scheme
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (sub1 i) (/ (n i) (+ result (d i))))))
  (iter (sub1 k) (/ (n k) (d k))))


(define (tan-cf x k)
  (cont-frac-iter
   (lambda (i) (if (= i 1) x (* x x -1)))
   (lambda (i) (- (* 2.0 i) 1))
   k))


; check result
(define x 1)
(display (tan-cf x 8)) (newline)
(display (tan x)) (newline)
```

Which returns:

```
1.557407724654856
1.557407724654902
```

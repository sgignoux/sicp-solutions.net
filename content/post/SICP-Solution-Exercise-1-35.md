---
title: "SICP - Solution: Exercise 1.35"
date: 2018-10-28T03:03:58+02:00
draft: false
---

**Exercise 1.35:** Show that the golden ratio $\varphi$ (1.2.2) is a fixed point of the transformation ${x\mapsto1+1/x}$, and use this fact to compute $\varphi$ by means of the `fixed-point` procedure.

**Solution**

Per definition, a fixed point for ${x\mapsto1+1/x}$ is:

$$x=1+\frac1x$$

Which can be rewritten as:

$$x^2=x+1$$
$$x^2-x-1=0$$

This is a second order polynomial whose solution is:

$$x=\frac{1+\sqrt5}2=\varphi$$

In order to compute $\varphi$ by means of the `fixed-point`, you can just insert the function with a `lambda` in `fixed-point`:

```scheme
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(display (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
```

Which evaluates to:

```
1.6180327868852458
```

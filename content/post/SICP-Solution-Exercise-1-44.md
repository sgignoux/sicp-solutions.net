---
title: "SICP - Solution: Exercise 1.44"
date: 2018-10-29T06:07:58+02:00
draft: false
---

**Exercise 1.44:** The idea of smoothing a function is an important concept in signal processing. If $f$ is a function and $dx$ is some small number, then the smoothed version of $f$ is the function whose value at a point $x$ is the average of ${f(x-dx)}$, ${f(x)}$, and ${f(x+dx)}$. Write a procedure `smooth` that takes as input a procedure that computes $f$ and returns a procedure that computes the smoothed $f$. It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtain the _n-fold smoothed function_. Show how to generate the $n$-fold smoothed function of any given function using `smooth` and `repeated` from Exercise 1.43.

**Solution**

```scheme
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
```

```scheme
(define (smooth-nth f n)
  ((repeated smooth n) f))
```

---
title: "SICP - Solution: Exercise 1.29"
date: 2018-10-22T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.29:** Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function $f$ between $a$ and $b$ is approximated as

$$\frac h3(y_0+4y_1+2y_2+4y_3+2y_4+\cdots+2y\_{n-2}+{4y\_{n-1}+y_n),}$$

where ${h=(b-a)/n}$, for some even integer $n$, and $y_k={f(a+kh)}$. (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments $f$, $a$, $b$, and $n$ and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with $n$=100 and $n$=1000), and compare the results to those of the integral procedure shown above.

**Solution**

The sum can be rewritten like this:

$$\frac h3(y_0+4(\underbrace{y_1+y_3+y_5+\cdots+y_n-1}\_{odd terms})+2(\underbrace{y_2+y_4+y_6+\cdots+y\_{n-2}}\_{even terms})+y_n)$$

This equation can be implemented in a manner that reuse the `sum` function that was defined previously like this:

```scheme
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; assuming n is even
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (+ (f a)
        (* 2 (sum f a       add-2h b))
        (* 4 (sum f (+ a h) add-2h b))
        (f b))
     (/ h 3)))

(define (cube x) (* x x x))
```

We can compare the difference between the original versions:

```
(display (integral cube 0 1 0.01)) (newline)
(display (integral cube 0 1 0.001)) (newline)
0.24998750000000042
0.249999875000001
```

And `integral-simpson` version:

```
(display (integral-simpson cube 0 1.0 100)) (newline)
(display (integral-simpson cube 0 1.0 1000)) (newline)
0.25000000000000044
0.25000000000000083
```

The `integral-simpson` gives much more accuracy for the same number of step.

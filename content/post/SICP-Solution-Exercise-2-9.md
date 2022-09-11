---
title: "SICP - Solution: Exercise 2.9"
date: 2019-01-11T07:09:58+02:00
draft: false
type: posts
---

**Exercise 2.9:** The width of an interval is half of the difference between its upper and lower bounds. The width is a measure of the uncertainty of the number specified by the interval. For some arithmetic operations the width of the result of combining two intervals is a function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of the argument intervals. Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted). Give examples to show that this is not true for multiplication or division.

**Solution**

We will use two interval $x$ and $y$. Per definition:

$$2\\cdot x\_{width}=x\_{upper}-x\_{lower}$$

$$2\\cdot y\_{width}=y\_{upper}-y\_{lower}$$

### Addition

Let's compute the bound for the sum of interval $x$ and $y$

$$z = x + y$$

$$z\_{lower}=x\_{lower}+y\_{lower}$$
$$z\_{upper}=x\_{upper}+y\_{upper}$$

Based on that, we can compute and simplify the width:

$$2\\cdot z\_{width}=z\_{upper}-z\_{lower}=(x\_{upper}+y\_{upper})-(x\_{lower}+y\_{lower})$$
$$2\\cdot z\_{width}=x\_{upper}-x\_{lower}+y\_{upper}-y\_{lower}$$
$$2\\cdot z\_{width}=2\\cdot x\_{width}+2\\cdot y\_{width}$$
$$z\_{width}=x\_{width}+y\_{width}$$

### Subtraction

Let's compute the bound for the subtraction of interval $x$ and $y$

$$z = x - y$$

$$z\_{lower}=x\_{lower}-y\_{upper}$$
$$z\_{upper}=x\_{upper}-y\_{lower}$$

Based on that, we can compute and simplify the width:

$$2\\cdot z\_{width}=z\_{upper}-z\_{lower}=(x\_{upper}-y\_{lower})-(x\_{lower}-y\_{upper})$$
$$2\\cdot z\_{width}=x\_{upper}-y\_{lower}-x\_{lower}+y\_{upper}$$
$$2\\cdot z\_{width}=x\_{upper}-x\_{lower}+y\_{upper}-y\_{lower}$$
$$z\_{width}=x\_{width}+y\_{width}$$

### Multiplication

One possible case, if all number are > 1

$$z\_{lower}=x\_{lower}*y\_{lower}$$
$$z\_{upper}=x\_{upper}*y\_{upper}$$

$$2\\cdot z\_{width}=z\_{upper}-z\_{lower}=(x\_{upper}*y\_{upper})-(x\_{lower}*y\_{lower})$$

Example:

```scheme
(newline)
(define r3 (make-interval 100.0 101.0))
(define r4 (make-interval 22.0 23.0))

(display "r3= ")  (display (width-interval r3)) (newline)
(display "r3= ")  (display (width-interval r4)) (newline)
(display "mul= ") (display (width-interval (mul-interval r3 r4))) (newline)
(display "div= ") (display (width-interval (div-interval r3 r4))) (newline)
```

```
r3=0.5
r4=0.5
mul=61.5
div=0.12154150197628466
```

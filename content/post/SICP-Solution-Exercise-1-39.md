---
title: "SICP - Solution: Exercise 1.39"
date: 2018-10-29T06:03:58+02:00
draft: false
---

**Exercise 1.39:** A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:

$$\tan\;x=\frac x{1-{\displaystyle\frac{x^2}{3-{\displaystyle\frac{x^2}{5-\cdots}}}}}$$

where `x` is in radians. Define a procedure `(tan-cf x k)` that computes an approximation to the tangent function based on Lambert’s formula. `k` specifies the number of terms to compute, as in Exercise 1.37.

**Solution**

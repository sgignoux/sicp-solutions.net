---
title: "SICP - Solution: Exercise 1.45"
date: 2018-10-29T06:08:58+02:00
draft: false
---

**Exercise 1.45:** We saw in 1.3.3 that attempting to compute square roots by naively finding a fixed point of ${y\mapsto x/y}$ does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped ${y\mapsto x/y^2}$. Unfortunately, the process does not work for fourth roots—a single average damp is not enough to make a fixed-point search for ${y\mapsto x/y^3}$ converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of ${y\mapsto x/y^3}$) the fixed-point search does converge. Do some experiments to determine how many average damps are required to compute $n^{\text{th}}$ roots as a fixed-point search based upon repeated average damping of $y\mapsto x/y^{n-1}$. Use this to implement a simple procedure for computing $n^{\text{th}}$ roots using `fixed-point`, `average-damp`, and the `repeated` procedure of Exercise 1.43. Assume that any arithmetic operations you need are available as primitives.

**Solution**

---
title: "SICP - Solution: Exercise 1.37"
date: 2018-10-28T05:03:58+02:00
draft: false
---

**Exercise 1.37:**

An infinite _continued fraction_ is an expression of the form

$$f\hspace{thinmathspace}=\hspace{thinmathspace}{\frac{N_1}{D_1+\frac{N_2}{D_2+\frac{N_3}{D_3+\dots}}}.}$$

As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/φ, where φ is the golden ratio (described in 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation—a so-called finite continued fraction k-term finite continued fraction—has the form
N1D1+N2⋱+NkDk.
Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/φ using
(cont-frac (lambda (i) 1.0)
(lambda (i) 1.0)
k)
for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?

If your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

**Solution**

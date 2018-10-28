---
title: "SICP - Solution: Exercise 1.37"
date: 2018-10-28T05:03:58+02:00
draft: false
---

**Exercise 1.37:**

An infinite _continued fraction_ is an expression of the form

$$f=\frac{N_1}{D_1+{\displaystyle\frac{N_2}{D_2+{\displaystyle\frac{N_3}{D_3+\cdots}}}}}$$

As an example, one can show that the infinite continued fraction expansion with the $N_i$ and the $D_i$ all equal to 1 produces ${1/\varphi}$, where $\varphi$ is the golden ratio (described in 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation—a so-called finite continued fraction k-term finite continued fraction—has the form

$$f=\frac{N_1}{D_1+{\displaystyle\frac{N_2}{\ddots+{\displaystyle\frac{N_k}{D_k}}}}}$$

Suppose that `n` and `d` are procedures of one argument (the term index $i$) that return the $N_i$ and $D_i$ of the terms of the continued fraction. Define a procedure `cont-frac` such that evaluating `(cont-frac n d k)` computes the value of the k-term finite continued fraction. Check your procedure by approximating ${1/\varphi}$ using

```scheme
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
```

for successive values of $k$. How large must you make $k$ in order to get an approximation that is accurate to 4 decimal places?

If your `cont-frac` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

**Solution**

TBD

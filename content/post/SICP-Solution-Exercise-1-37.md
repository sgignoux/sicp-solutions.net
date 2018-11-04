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

for successive values of `k`. How large must you make `k` in order to get an approximation that is accurate to 4 decimal places?

If your `cont-frac` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

**Solution**

### Recursive process continued fraction

Let's start with the recursive version, as it is the most straightforward from the definition:

```scheme
(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1))
```

### Estimating ${1/\varphi}$

By running the function with larger number `k`, we have this result:

| k   | result             |
| --- | ------------------ |
| 4   | 0.6000000000000001 |
| 5   | 0.625              |
| 6   | 0.6153846153846154 |
| 7   | 0.6190476190476191 |
| 8   | 0.6176470588235294 |
| 9   | 0.6181818181818182 |
| 10  | 0.6179775280898876 |
| 11  | 0.6180555555555556 |
| 12  | 0.6180257510729613 |

Since ${1/\varphi} = 0.618033988749894848204586834365638...$, `k` must be at least 11 in order to have an approximation accurate to 4 decimal places.

### Iterative process continued fraction

The solution I found is to start at the lowest fraction and work all the way up, keeping the result in `result`:

```scheme
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (sub1 i) (/ (n i) (+ result (d i))))))
  (iter (sub1 k) (/ (n k) (d k))))
```
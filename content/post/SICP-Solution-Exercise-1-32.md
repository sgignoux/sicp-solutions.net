---
title: "SICP - Solution: Exercise 1.32"
date: 2018-10-25T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.32:**

Show that sum and product (Exercise 1.31) are both special cases of a still more general notion called `accumulate` that combines a collection of terms, using some general accumulation function:

```scheme
   (accumulate combiner null-value term a next b)
```

Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.

If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

**Solution**

The code can be derived easily from the `sum` and `sum-iter` developed in the previous exercise:

```scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
```

Based on this definition, we can define the `sum` and `sum-iter` functions:

```scheme
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))
```

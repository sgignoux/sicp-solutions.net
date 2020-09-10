---
title: "SICP - Solution: Exercise 1.33"
date: 2018-10-26T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.33:** You can obtain an even more general version of accumulate (Exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

1. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
2. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i<n such that GCD(i,n)=1).

**Solution**

### `filtered-accumulate` implementation

```scheme
(define (filtered-accumulate predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a) (term a) null-value)
       (filtered-accumulate predicate? combiner null-value term (next a) next b))))
```

### sum of the squares of the prime numbers in the interval a to b

```scheme
(define (inc n) (+ n 1))

(define (sum-of-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))
```

### Product of all the positive integers less than n that are relatively prime to n

The first step is defining the predicate to check for relative prime:

```scheme
  (define (relative-prime? i n)
    (= (gcd i n) 1))
```

But `predicate?` in `filtered-accumulate` takes only one argument. We need to specify the function inside `product-of-relative-prime` so that we can get access to `n`:

```scheme
(define (identity x) x)

(define (product-of-relative-prime n)
  (define (relative-prime? i)
    (= (gcd i n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))
```

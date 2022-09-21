---
title: "SICP - Solution: Exercise 2.5"
date: 2019-01-07T07:09:58+02:00
draft: false
type: posts
---

## Exercise 2.5

> Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair $a$ and $b$ as the integer that is the product ${2^a3^b}$. Give the corresponding definitions of the procedures `cons`, `car`, and `cdr`.

## Solution

This method can work not just with 2 and 3, but any relative prime numbers. For example, using $a=2$ and $b=3$, we have:

$$2^43^5=2\times2\times2\times2\times3\times3\times3\times3\times3=3888$$

By this definition, $3888$ can be divided $2^4=16$ before the result will have a remainder. Dividing by one more will give $\frac{3888}{2^5}=121.5$. We can use this to encode the number by computing `cons` using the formula:

```scheme
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
```

The implementation of `car` and `cdr` looks very much alike: it just counts the number of times the number can be divided by 2 or 3 before returning a remainder:

```scheme
(define (car x)
  (define (car-iter x count)
  (if (= 0 (remainder x 2))
      (car-iter (/ x 2) (+ 1 count))
      count))
  (car-iter x 0))

(define (cdr x)
  (define (cdr-iter x count)
  (if (= 0 (remainder x 3))
      (cdr-iter (/ x 3) (+ 1 count))
      count))
  (cdr-iter x 0))

(print (cons 3 18))       (newline)
(print (car (cons 3 18))) (newline)
(print (cdr (cons 3 18))) (newline)
```

I have not found more efficient methods than this.

The result of the evaluation:

```
3099363912
3
18
```

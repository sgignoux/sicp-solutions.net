---
title: "SICP - Solution: Exercise 2.7"
date: 2019-01-09T07:09:58+02:00
draft: false
type: posts
---

## Exercise 2.7

> Alyssa’s program is incomplete because she has not specified the implementation of the interval abstraction. Here is a definition of the interval constructor:
> 
> ```scheme
> (define (make-interval a b) (cons a b))
> ```
> 
> Define selectors upper-bound and lower-bound to complete the implementation.

## Solution

```scheme
(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))
```

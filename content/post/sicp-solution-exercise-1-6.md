---
title: "SICP - Solution: Exercise 1.6"
date: 2018-09-28T21:03:58+02:00
draft: false
type: posts
---

## Exercise 1.6

> Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
>
> ```scheme
> (define (new-if predicate
>                 then-clause
>                 else-clause)
>   (cond (predicate then-clause)
>         (else else-clause)))
> ```
>
> Eva demonstrates the program for Alyssa:
>
> ```scheme
> (new-if (= 2 3) 0 5)
> 5
> 
> (new-if (= 1 1) 0 5)
> 0
> ```
>
> Delighted, Alyssa uses new-if to rewrite the square-root program:
>
> ```scheme
> (define (sqrt-iter guess x)
>   (new-if (good-enough? guess x)
>           guess
>           (sqrt-iter (improve guess x) x)))
> ```
>
> What happens when Alyssa attempts to use this to compute square roots? Explain.

## Solution

Since `new-if` is a function, and not a special form, each parameter subexpression will be evaluated _before_ the procedure is applied. It means that when executing the `sqrt-iter` function, `(good-enough? guess x)`, `guess` and `(sqrt-iter (improve guess x) x)` will always be evaluated before `new-if` is applied, whatever `(good-enough? guess x)` evaluates to.

Since the second alternative `(sqrt-iter (improve guess x) x)` is calling the function recursively, the function will be stuck in an infinite loop. In this case, it is interesting to note that `new-if` will never be executed.

You can check by executing:

```scheme
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

(define (improve guess x) (average guess (/ x guess)))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))


(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))


(sqrt-iter 1.0 4) ; Infinite loop
```

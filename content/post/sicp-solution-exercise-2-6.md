---
title: "SICP - Solution: Exercise 2.6"
date: 2019-01-08T07:09:58+02:00
draft: false
type: posts
---

## Exercise 2.6

> In case representing pairs as procedures wasn’t mind-boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as
> 
> ```
> (define zero (lambda (f) (lambda (x) x)))
> 
> (define (add-1 n)
>   (lambda (f) (lambda (x) (f ((n f) x)))))
> ```
> 
> This representation is known as Church numeral's, after its inventor, Alonzo Church, the logician who invented the λ-calculus.
> 
> Define `one` and `two` directly (not in terms of `zero` and `add-1`). (Hint: Use substitution to evaluate `(add-1 zero)`). Give a direct definition of the addition procedure `+` (not in terms of repeated application of `add-1`).

## Solution

```scheme
(add-1 zero)

(add-1 (lambda (f) (lambda (x) x))

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x) f) x))))

(lambda (f) (lambda (x) (f x)))
```

From this we can define:

```scheme
(define one (lambda (f) (lambda (x) (f x))))

```

```scheme
(add-1 one)

(add-1 (lambda (f) (lambda (x) (f x))))

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f) (lambda (x) (f (f x))))

```

From this we can define:

```scheme

(define two (lambda (f) (lambda (x) (f (f x)))))

```

The addition will be defined as:

```scheme
(define (add  m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
```

To check the result, we can define `f` as `add1` and `x` as 0:

```scheme
(define one   (add-1 zero))
(define two   (add-1  one))
(define three (add-1  two))

(print ((zero add1) 0)) (newline)
(print (((add-1 zero) add1) 0)) (newline)
(print (((add-1 (add-1 zero)) add1) 0)) (newline)
(print (((add-1 (add-1 zero)) add1) 0)) (newline)
(print (((add three two) add1) 0)) (newline)
```

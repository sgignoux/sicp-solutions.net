---
title: "SICP - Solution: Exercise 1.43"
date: 2018-10-29T06:06:58+02:00
draft: false
---

**Exercise 1.43:** If $f$ is a numerical function and $n$ is a positive integer, then we can form the $n^{\text{th}}$ repeated application of $f$, which is defined to be the function whose value at $x$ is ${f(f(\dots(f(x))\dots))}$. For example, if $f$ is the function ${x\mapsto x+1}$, then the $n^{\text{th}}$ repeated application of f is the function ${x\mapsto x+n}$. If f is the operation of squaring a number, then the $n^{\text{th}}$ repeated application of $f$ is the function that raises its argument to the ${2^n\text{-th}}$ power. Write a procedure that takes as inputs a procedure that computes $f$ and a positive integer $n$ and returns the procedure that computes the $n^{\text{th}}$ repeated application of f. Your procedure should be able to be used as follows:

```
((repeated square 2) 5)
625
```

Hint: You may find it convenient to use `compose` from Exercise 1.42.

**Solution**

The solution took me some time to figure out. Manipulating higher-order functions like this can be tough, especially without a clear type signatures for each function. DrRacket `trace` function was most useful.

```scheme
(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(display ((repeated square 2) 5)) (newline)
```

### Note: `(- 1 n)` is not the same as `(- n 1)`

Small gotcha that I found while working on this exercise:

```scheme
(define x 10)
(display (- 1 x)) (newline)
(display (- x 1)) (newline)
```

Evaluates to:

```
-9
9
```

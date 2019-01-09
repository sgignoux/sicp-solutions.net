---
title: "SICP - Solution: Exercise 2.4"
date: 2019-01-06T07:09:58+02:00
draft: false
---

**Exercise 2.4:** Here is an alternative procedural representation of pairs. For this representation, verify that `(car (cons x y))` yields `x` for any objects `x` and `y`.

```
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))`
```

What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of 1.1.5.)

**Solution**

Applyting the substition model on `cons` to:

```
(car (cons x y))
```

will give:

```
(car (lambda (m) (m x y)))
```

It means that `car` will take as parameter the anonymous function `(lambda (m) (m x y))`. This function takes a function `m` as a parameter and this function `m` will receive `x` and `y` as parameters.

The definition of `car` takes a function as parameter and will evaluate this function by passing an anonymous function as argument: `(lambda (p q) p)`. This anonymous function takes two parameters and return the first one.

We can continue our substition by inserting the definition of `car`:

```
((lambda (m) (m x y)) (lambda (p q) p))
```

This looks like a lot of parenthesis, but it means that the first function `(lambda (m) (m x y))` takes the anonymous function `(lambda (p q) p)` as a parameter. When substituting `m` for the parameter, we have:

```
((lambda (p q) p) x y)
```

which will evaluate to:

```
x
```

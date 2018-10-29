---
title: "SICP - Solution: Exercise 1.41"
date: 2018-10-29T06:04:58+02:00
draft: false
---

**Exercise 1.41:** Define a procedure `double` that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if `inc` is a procedure that adds 1 to its argument, then `(double inc)` should be a procedure that adds 2. What value is returned by

```
(((double (double double)) inc) 5)
```

**Solution**

```scheme
(define (double f)
  (lambda (x)
    (f (f x))))
```

Since `double` is a procedure that return a procedure that applies the original procedure twice, then `(double double)` is a procedure that return a procedure that applies the original procedure four times.

Then `(double (double double))` will return a procedure that applies the original procedure height times.

Which means that `(double (double double)) inc)` is a procedure that applis `inc` height times. Thus `(((double (double double)) inc) 5)` should evaluate to 13.

```
(double f) -> (f (f x))
(double double) -> (double (double x))
(double (double double)) -> ((double double) ((double double) x)) -> ((double double) (double (double x))) -> ((double (double (double (double x)))))
```

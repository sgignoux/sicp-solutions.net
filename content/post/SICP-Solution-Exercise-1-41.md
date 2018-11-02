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

The definition of `double` is a function that takes a function as parameter and apply it twice:

```scheme
(define (double f)
  (lambda (x)
    (f (f x))))
```

Now, lets break `(((double (double double)) inc) 5)` step by step. `(double double)` is a procedure that return a procedure that applies the original procedure four times:

```
((double f) x)→ (f (f x))
(((double double) f) x) → ((double (double f)) x)
```

Then `(double (double double))` will return a procedure that applies `(double double)` twice:

```scheme
(((double (double double)) f) x) → (((double double) ((double double) f)) x)
                                 → (((double double) (double (double f))) x)
                                 → (((double (double (double (double f))))) x)
```

This is a procedure that apply `f` $2\times2\times2\times2=16$ times.

Which means that `(double (double double)) inc)` is a procedure that applies `inc` 16 times. Thus `(((double (double double)) inc) 5)` should evaluate to 21.

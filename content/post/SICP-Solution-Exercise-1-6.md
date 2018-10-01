---
title: "SICP - Solution: Exercise 1.6"
date: 2018-09-28T21:03:58+02:00
draft: false
---

Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```scheme
(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```scheme
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
```

Delighted, Alyssa uses new-if to rewrite the square-root program:

```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.

**Solution:**

Since `new-if` is a function, each parameters subexpressions will be evaluated _before_ the procedure is applied. It means that when evaluating:

```scheme
(new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))
```

the condition and all the alternatives of the if will always be evaluated, whatever `(good-enough? guess x)` is true or false. Since the second alternative is calling the function itself recursively, the function will stuck in an infinite loop.

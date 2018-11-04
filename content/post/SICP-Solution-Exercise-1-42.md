---
title: "SICP - Solution: Exercise 1.42"
date: 2018-10-29T06:05:58+02:00
draft: false
---

**Exercise 1.42:** Let $f$ and $g$ be two one-argument functions. The composition $f$ after $g$ is defined to be the function ${x\mapsto f(g(x))}$. Define a procedure compose that implements composition. For example, if `inc` is a procedure that adds 1 to its argument,

```
((compose square inc) 6)
49
```

**Solution**

From the definition, we can write:

```scheme
(define (compose f g)
  (lambda (x)
    (f (g x))))
```

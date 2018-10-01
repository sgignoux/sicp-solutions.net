---
title: "SICP - Solution: Exercise 1.4"
date: 2018-09-26T21:03:58+02:00
draft: false
---

Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

**Solution:**

If $b$ is strictly a positive number return $a+b$, else return $a-b$.

In other word, this function compute ${a+\left|b\right|.}$

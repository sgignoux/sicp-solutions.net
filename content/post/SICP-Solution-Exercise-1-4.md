---
title: "SICP - Solution: Exercise 1.4"
date: 2018-09-26T21:03:58+02:00
draft: false
type: posts
---

## Exercise 1.4

> Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
> 
> ```scheme
> (define (a-plus-abs-b a b)
>   ((if (> b 0) + -) a b))
> ```

## Solution

If $b$ is strictly a positive number, the operator expression `(if (> b 0) + -)` will evaluate to `+` the result will be $a+b$.

If all other cases, the result will be $a-b$.

In other words, this function compute $a+\left|b\right|$.

---
title: "SICP - Solution: Exercise 1.30"
date: 2018-10-23T04:03:58+02:00
draft: false
type: posts
---

## Exercise 1.30

> The `sum` procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:
> 
> ```scheme
> (define (sum term a next b)
>   (define (iter a result)
>     (if ⟨??⟩
>         ⟨??⟩
>         (iter ⟨??⟩ ⟨??⟩)))
>   (iter ⟨??⟩ ⟨??⟩))
> ```

## Solution

The solution is:

```scheme
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))
```

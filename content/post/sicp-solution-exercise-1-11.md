---
title: "SICP - Solution: Exercise 1.11"
date: 2018-10-02T21:06:58+02:00
draft: false
type: posts
---

## Exercise 1.11

> A function $f$ is defined by the rule that ${f(n)=n}$ if ${n<3}$ and
${f(n)}={f(n-1)}+{2f(n-2)}+{3f(n-3)}$ if ${n\geq3}$.
> 
> Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

## Solution

Recursive version:

```scheme
(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))
```

Iterative version:

```scheme
(define (f-iterative n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1  ; Final result of the computation
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3))  ; Compute f(n)
                n-1
                n-2 
                (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))
```

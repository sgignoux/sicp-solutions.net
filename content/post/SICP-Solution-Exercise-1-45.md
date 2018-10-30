---
title: "SICP - Solution: Exercise 1.45"
date: 2018-10-29T06:08:58+02:00
draft: false
---

**Exercise 1.45:** We saw in 1.3.3 that attempting to compute square roots by naively finding a fixed point of ${y\mapsto x/y}$ does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped ${y\mapsto x/y^2}$. Unfortunately, the process does not work for fourth roots—a single average damp is not enough to make a fixed-point search for ${y\mapsto x/y^3}$ converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of ${y\mapsto x/y^3}$) the fixed-point search does converge. Do some experiments to determine how many average damps are required to compute $n^{\text{th}}$ roots as a fixed-point search based upon repeated average damping of $y\mapsto x/y^{n-1}$. Use this to implement a simple procedure for computing $n^{\text{th}}$ roots using `fixed-point`, `average-damp`, and the `repeated` procedure of Exercise 1.43. Assume that any arithmetic operations you need are available as primitives.

**Solution**

### Experimentation

First, let's implement a function `nth-root-damped` that allow us to quickly test the parameters `nth` and `damping`:

```scheme
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (nth-root-damped x nth damp)
  (fixed-point
    ((repeated average-damp damp)
    (lambda (y)
      (/ x (power y (- nth 1)))))
   1.0))
```

By varying the parameters, we can see for $x=2$ the minimal number of damping needed for the function to converge:

| nth | minimal damp |
| --- | ------------ |
| 2   | 1            |
| 3   | 1            |
| 4   | 2            |
| 5   | 2            |
| 6   | 2            |
| 7   | 2            |
| 8   | 3            |
| 9   | 3            |
| 10  | 3            |
| 11  | 3            |
| 12  | 3            |
| 13  | 3            |
| 14  | 3            |
| 15  | 3            |
| 16  | 4            |
| 17  | 4            |
| ... | 4            |
| 30  | 4            |
| 31  | 4            |
| 32  | 5            |
| ... | 5            |
| 63  | 5            |
| 64  | 6            |

The pattern where the number if minimal damp do converge looks to increase everytime the nth is reaching a power of 2. By searching the [documentation](https://docs.racket-lang.org/reference/generic-numbers.html), it seems that we can compute minimal damp using a base 2 logarithm and the `floor` function to provide an integer (needed for computing the power):

```
(floor (log 63 2))
> 5

(floor (log 64 2))
> 6
```

### Solution

We can insert that in our solution that becomes:

```scheme
(define (nth-root x nth)
  (fixed-point 
    ((repeated average-damp (floor (log nth 2))) 
    (lambda (y) 
      (/ x (power y (- nth 1)))))
   1.0))
```

We can try the solution with large `nth` to check if it holds:

```
(display (nth-root 2 258))
> 1.0026902132630033
```
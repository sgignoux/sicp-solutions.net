---
title: "SICP - Solution: Exercise 1.21"
date: 2018-10-15T02:03:58+02:00
draft: false
type: posts
---

## Exercise 1.21

> Use the `smallest-divisor` procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

## Solution

Just run the program, using `trace`:

```scheme
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(trace find-divisor)
```

Then we can run a the examples:

```
(display (smallest-divisor 199))
>(find-divisor 199 2)
>(find-divisor 199 3)
>(find-divisor 199 4)
>(find-divisor 199 5)
>(find-divisor 199 6)
>(find-divisor 199 7)
>(find-divisor 199 8)
>(find-divisor 199 9)
>(find-divisor 199 10)
>(find-divisor 199 11)
>(find-divisor 199 12)
>(find-divisor 199 13)
>(find-divisor 199 14)
>(find-divisor 199 15)
<199
199
```

```
(display (smallest-divisor 1999))
>(find-divisor 1999 2)
>(find-divisor 1999 3)
>(find-divisor 1999 4)
>(find-divisor 1999 5)
>(find-divisor 1999 6)
>(find-divisor 1999 7)
>(find-divisor 1999 8)
>(find-divisor 1999 9)
>(find-divisor 1999 10)
>(find-divisor 1999 11)
>(find-divisor 1999 12)
>(find-divisor 1999 13)
>(find-divisor 1999 14)
>(find-divisor 1999 15)
>(find-divisor 1999 16)
>(find-divisor 1999 17)
>(find-divisor 1999 18)
>(find-divisor 1999 19)
>(find-divisor 1999 20)
>(find-divisor 1999 21)
>(find-divisor 1999 22)
>(find-divisor 1999 23)
>(find-divisor 1999 24)
>(find-divisor 1999 25)
>(find-divisor 1999 26)
>(find-divisor 1999 27)
>(find-divisor 1999 28)
>(find-divisor 1999 29)
>(find-divisor 1999 30)
>(find-divisor 1999 31)
>(find-divisor 1999 32)
>(find-divisor 1999 33)
>(find-divisor 1999 34)
>(find-divisor 1999 35)
>(find-divisor 1999 36)
>(find-divisor 1999 37)
>(find-divisor 1999 38)
>(find-divisor 1999 39)
>(find-divisor 1999 40)
>(find-divisor 1999 41)
>(find-divisor 1999 42)
>(find-divisor 1999 43)
>(find-divisor 1999 44)
>(find-divisor 1999 45)
<1999
1999
```

```
(display (smallest-divisor 19999))
>(find-divisor 19999 2)
>(find-divisor 19999 3)
>(find-divisor 19999 4)
>(find-divisor 19999 5)
>(find-divisor 19999 6)
>(find-divisor 19999 7)
<7
7
```

---
title: "SICP - Solution: Exercise 1.38"
date: 2018-10-29T05:03:58+02:00
draft: false
type: posts
---

## Exercise 1.38

> In 1737, the Swiss mathematician Leonhard Euler published a memoir _De Fractionibus Continuis_, which included a continued fraction expansion for $e−2$, where $e$ is the base of the natural logarithms. In this fraction, the $N_i$ are all 1, and the $D_i$ are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, …. Write a program that uses your `cont-frac` procedure from Exercise 1.37 to approximate $e$, based on Euler’s expansion.

## Solution

The key to this exercise is writing a function that will return successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, …. Let's build this function step by step. In order to facilitate our work, we can write a couple of functions to display the first `n` elements of any series and use a dummy implementation of `d-euler`:

```scheme
(define (d-euler i)
  0)

(define (display-serie f n)
  (define (rec i)
    (display (f i)) (display ", ")
    (if (= i n)
        (newline)
        (rec (+ i 1))))
  (rec 1))

(display-serie d-euler 12)
```

which evaluates to:

```
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
```

The regular grouping of 3 indicates a `modulo 3` going on. Let's try to add it:

```scheme
(define (d-euler i)
  (if (= (modulo i 3) 2)
      9
      1))
```

Which evaluates to:

```
1, 9, 1, 1, 9, 1, 1, 9, 1, 1, 9, 1,
```

Now we need to compute the proper number instead of 9. It seems to be twice the number of the triplet in the series:

```scheme
(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2(/ (+ i 1) 3))
      1))
```

and we evaluate it:

```
1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 1,
```

Finally, we can put all together to get an approximation of $e$ (accurate to 4 decimal places when k = 8):

```scheme
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter (- k 1) (/ (n k) (d k))))

(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2 (/ (+ i 1) 3))
      1))

(+ 2 (cont-frac-iter (lambda (i) 1.0)
                 d-euler
                 8))
```

Which gives:

```
2.718279569892473
```

---
title: "SICP - Solution: Exercise 1.12"
date: 2018-10-03T21:06:58+02:00
draft: false
---

The following pattern of numbers is called Pascal’s triangle.

```
         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
       . . .
```

The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

**Solution:**

The solution is easier to see if you change slightly the tabulation:

```
 1
 1   1
 1   2   1
 1   3   3   1
 1   4   6   4   1
       . . .
```

```scheme
(define (pascal n i)
  (cond ((= n 1) 1)
        ((or (= i 1) (= i n)) 1)
        (else (+ (pascal (- n 1)  (- i 1))
                 (pascal (- n 1) i)))))

(define (display-pascal-row n)
  (define (column-iter i)
    (display (pascal n i)) (display " ")
    (if (= i n)
        (newline)
        (column-iter (+ i 1))))
  (column-iter 1))

(define (display-pascal n)
  (define (display-pascal-iter i)
    (display-pascal-row i)
    (if (= i n)
        (newline)
        (display-pascal-iter (+ i 1))))
  (display-pascal-iter 1))
```

`(display-pascal 10)`:

```
1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1
1 6 15 20 15 6 1
1 7 21 35 35 21 7 1
1 8 28 56 70 56 28 8 1
1 9 36 84 126 126 84 36 9 1
```

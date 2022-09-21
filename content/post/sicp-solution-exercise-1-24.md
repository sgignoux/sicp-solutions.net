---
title: "SICP - Solution: Exercise 1.24"
date: 2018-10-17T05:03:58+02:00
draft: false
type: posts
---

## Exercise 1.24

> Modify the `timed-prime-test` procedure of Exercise 1.22 to use `fast-prime?` (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has ${\mathrm\Theta(\log n)}$ growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

## Solution

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else #f)))
```

I choosed to run each test on 100 random numbers, but this is somewhat a guessed value:

```
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      "nothing"))
```

Here too, in order to increase precision of the execution time measurement, all computation are run 1000 times on each prime number for each of the algorithm.

I ran in a few issues with the random number generator for the largest prime in my table. I just removed them as it doesn't change the conclusion.

### DrRacket

| log(prime) | prime         | time prime? (µs) | time fast-prime? (µs) |
| ---------- | ------------- | ---------------- | --------------------- |
| 3          | 1,009         | 2.8029           | 175.80                |
| 3          | 1,013         | 2.3579           | 160.85                |
| 3          | 1,019         | 2.2888           | 179.21                |
| 4          | 10,007        | 8.1271           | 218.31                |
| 4          | 10,009        | 7.7409           | 193.58                |
| 4          | 10,037        | 7.6669           | 241.30                |
| 5          | 100,003       | 25.369           | 238.16                |
| 5          | 100,019       | 24.364           | 279.69                |
| 5          | 100,043       | 24.239           | 240.71                |
| 6          | 1,000,003     | 76.642           | 388.47                |
| 6          | 1,000,033     | 91.104           | 277.81                |
| 6          | 1,000,037     | 83.062           | 304.60                |
| 7          | 10,000,019    | 245.59           | 364.91                |
| 7          | 10,000,079    | 253.24           | 372.02                |
| 7          | 10,000,103    | 264.88           | 358.31                |
| 8          | 100,000,007   | 855.93           | 386.96                |
| 8          | 100,000,037   | 974.68           | 392.14                |
| 8          | 100,000,039   | 829.26           | 401.62                |
| 9          | 1,000,000,007 | 2588.9           | 438.92                |
| 9          | 1,000,000,009 | 2728.9           | 425.29                |
| 9          | 1,000,000,021 | 2848.4           | 455.42                |

Which can be summarized:

| log(prime) | average time `prime?` (µs) | delta for 10x (µs) | average time `fast-prime?` (µs) | delta for 10x (µs) |
| ---------- | -------------------------- | ------------------ | ------------------------------- | ------------------ |
| 3          | 2,4832                     |                    | 171,95                          |                    |
| 4          | 7,8450                     | 5,3618             | 217,73                          | 45,7               |
| 5          | 24,658                     | 16,813             | 252,85                          | 35,1               |
| 6          | 83,603                     | 58,945             | 323,63                          | 70,7               |
| 7          | 254,57                     | 170,97             | 365,08                          | 41,4               |
| 8          | 886,62                     | 632,04             | 393,57                          | 28,4               |
| 9          | 2722,1                     | 1835,5             | 439,88                          | 46,3               |

### Chicken Scheme (compiled)

| log(prime) | prime         | time prime? (µs) | time fast-prime? (µs) |
| ---------- | ------------- | ---------------- | --------------------- |
| 3          | 1,009         | 4.0              | 172.0                 |
| 3          | 1,013         | 3.0              | 180.0                 |
| 3          | 1,019         | 4.0              | 193.0                 |
| 4          | 10,007        | 11.0             | 221.0                 |
| 4          | 10,009        | 13.0             | 218.0                 |
| 4          | 10,037        | 10.0             | 224.0                 |
| 5          | 100,003       | 35.0             | 256.0                 |
| 5          | 100,019       | 35.0             | 261.0                 |
| 5          | 100,043       | 38.0             | 276.0                 |
| 6          | 1,000,003     | 113.0            | 297.0                 |
| 6          | 1,000,033     | 111.0            | 296.0                 |
| 6          | 1,000,037     | 114.0            | 311.0                 |
| 7          | 10,000,019    | 353.0            | 355.0                 |
| 7          | 10,000,079    | 355.0            | 381.0                 |
| 7          | 10,000,103    | 362.0            | 384.0                 |
| 8          | 100,000,007   | 1157.0           | 435.0                 |
| 8          | 100,000,037   | 1126.0           | 444.0                 |
| 8          | 100,000,039   | 1126.0           | 450.0                 |
| 9          | 1,000,000,007 | 3516.0           | 462.0                 |
| 9          | 1,000,000,009 | 3744.0           | 477.0                 |
| 9          | 1,000,000,021 | 3641.0           | 499.0                 |

Which can be summarized:

| log(prime) | average time `prime?` (µs) | time multiplication for 10x | average time `fast-prime?` (µs) | time increases for 10x (µs) |
| ---------- | -------------------------- | --------------------------- | ------------------------------- | -------------------------- |
| 3          | 3,67                       |                             | 181,67                          |                            |
| 4          | 11,33                      | 3,09                        | 221                             | 39,3                       |
| 5          | 36                         | 3,18                        | 264,33                          | 43,3                       |
| 6          | 112,67                     | 3,13                        | 301,33                          | 37,0                       |
| 7          | 356,67                     | 3,17                        | 373,33                          | 72,0                       |
| 8          | 1136,33                    | 3,19                        | 443                             | 69,7                       |
| 9          | 3633,67                    | 3,20                        | 479,33                          | 36,3                       |

### Conclusion

When the size of `prime` is 10 times larger, `prime?` require 3 times more computation.

When the size of  `prime` is 10 times larger, `fast-prime?` require a constant increase of 50µs. ${\mathrm\Theta(\log n)}$ growth means that when the prime are ten times larger, the time will increase by a constant amount ${\log(100)-\log(10)=1}$. This is quite clear here.

Although that for smaller number `prime?` is faster, `fast-prime?` become much faster with larger and larger prime.

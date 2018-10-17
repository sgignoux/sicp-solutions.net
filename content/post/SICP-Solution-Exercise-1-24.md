---
title: "SICP - Solution: Exercise 1.24"
date: 2018-10-16T05:03:58+02:00
draft: false
---

**Exercise 1.24:** Modify the `timed-prime-test` procedure of Exercise 1.22 to use `fast-prime?` (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has ${\mathrm\Theta(\log\;n)}$ growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

**Solution**

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

Using 100, because of precision of time measure:

```
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      "nothing"))
```


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

Using 100 run for fast-prime? 

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


how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

${\mathrm\Theta(\log\;n)}$ growth means that when the prime are ten times larger, the time will increase by a constant amount: ${\log(100)-\log(10)=1}$




Issues with 10
```
1.           . random: contract violation
  expected: (or/c (integer-in 1 4294967087) pseudo-random-generator?)
  given: 10000000000
```
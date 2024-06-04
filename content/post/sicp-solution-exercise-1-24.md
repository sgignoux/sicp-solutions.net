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

I chose to run each test on 100 random numbers, but this is somewhat a guessed value:

```
(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      "nothing"))
```

Here too, in order to increase the precision of execution times, all computations are run 1000 times on each prime number for each algorithm.

I ran into a few issues with the random number generator for the largest prime in my table. I just removed them as it doesn't change the conclusion.

### DrRacket

The raw data from DrRacket, using some variation of the code you can find [here](https://github.com/sgignoux/sicp-solutions.net/blob/master/solutions/chapter-1/Exercise-1-22_23_24.rkt), where the average execution time for `prime?` and `fast-prime?`:

| log(prime) |  prime number | `prime?` (µs) | `fast-prime?` (µs) |
| ---------- | ------------: | ------------: | -----------------: |
| 3          |         1,009 |           2.8 |             175.80 |
| 3          |         1,013 |           2.3 |             160.85 |
| 3          |         1,019 |           2.2 |             179.21 |
| 4          |        10,007 |           8.1 |             218.31 |
| 4          |        10,009 |           7.7 |             193.58 |
| 4          |        10,037 |           7.6 |             241.30 |
| 5          |       100,003 |          25.3 |             238.16 |
| 5          |       100,019 |          24.3 |             279.69 |
| 5          |       100,043 |          24.2 |             240.71 |
| 6          |     1,000,003 |          76.6 |             388.47 |
| 6          |     1,000,033 |          91.1 |             277.81 |
| 6          |     1,000,037 |          83.0 |             304.60 |
| 7          |    10,000,019 |         245.5 |             364.91 |
| 7          |    10,000,079 |         253.2 |             372.02 |
| 7          |    10,000,103 |         264.8 |             358.31 |
| 8          |   100,000,007 |         855.9 |             386.96 |
| 8          |   100,000,037 |         974.6 |             392.14 |
| 8          |   100,000,039 |         829.2 |             401.62 |
| 9          | 1,000,000,007 |        2588.9 |             438.92 |
| 9          | 1,000,000,009 |        2728.9 |             425.29 |
| 9          | 1,000,000,021 |        2848.4 |             455.42 |

Which can be summarized:

| log(prime) | average `prime?` (µs) | `prime?` delta for 10x (µs) | average `fast-prime?` (µs) | `fast-prime?` delta for 10x (µs) |
| ---------- | --------------------: | --------------------------: | -------------------------: | -------------------------------: |
| 3          |                   2.4 |                             |                     171.95 |                                  |
| 4          |                   7.8 |                         5.3 |                     217.73 |                             45.7 |
| 5          |                  24.6 |                        16.8 |                     252.85 |                             35.1 |
| 6          |                 83.60 |                        58.9 |                     323.63 |                             70.7 |
| 7          |                 254.5 |                       170.9 |                     365.08 |                             41.4 |
| 8          |                 886.6 |                       632.0 |                     393.57 |                             28.4 |
| 9          |                2722.1 |                      1835.5 |                     439.88 |                             46.3 |

Where:

- log(prime): number of digits in the prime number
- average `prime?` (µs): average execution time for the 3 prime numbers with log(prime) digits using `prime?`
- `prime?` delta for 10x (µs): for `prime?`, difference in average execution time between prime numbers with n and n-1 digits. For example, it takes 16.813 µs longer to test prime numbers with 5 digits than prime numbers with 4 digits.
- average `fast-prime?` (µs) average execution time for the 3 prime numbers with log(prime) digits using `fast-prime?`
- `fast-prime?` delta for 10x (µs): for `fast-prime?`, difference in average execution time between prime numbers with n and n-1 digits. For example, it takes 35.1 µs longer to test prime numbers with 5 digits than prime numbers with 4 digits.

### Conclusion

Whether looking at the table, we can see that, as the size of the prime numbers increase:

- `prime?` delta for 10x (µs) is increasing linearly, with an increase of around a factor 3 between each step.
- `fast-prime?` delta for 10x (µs) is more or less constant

When the size of `prime` is 10 times larger, `prime?` requires around 3 times more computation.

When the size of  `prime` is 10 times larger, `fast-prime?` require only a constant increase of time (around 50µs on my computer). ${\mathrm\Theta(\log n)}$ growth means that when the prime are ten times larger, the time will increase by a constant amount ${\log(100)-\log(10)=1}$. This is quite clear here.

Although for smaller number `prime?` is faster, `fast-prime?` become much faster with larger and larger prime.

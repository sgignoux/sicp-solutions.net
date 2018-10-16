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


| log(prime) | prime          | time (ms)  |
| ---------- | -------------- | ---------- |
| 3          | 1,009          | 0.15307617 |
| 3          | 1,013          | 0.15991210 |
| 3          | 1,019          | 0.16601562 |
| 4          | 10,007         | 0.20117187 |
| 4          | 10,009         | 0.19311523 |
| 4          | 10,037         | 0.19921875 |
| 5          | 100,003        | 0.24316406 |
| 5          | 100,019        | 0.23583984 |
| 5          | 100,043        | 0.23706054 |
| 6          | 1,000,003      | 0.25805664 |
| 6          | 1,000,033      | 0.25805664 |
| 6          | 1,000,037      | 0.26611328 |
| 7          | 10,000,019     | 0.31396484 |
| 7          | 10,000,079     | 0.32885742 |
| 7          | 10,000,103     | 0.33007812 |
| 8          | 100,000,007    | 0.37182617 |
| 8          | 100,000,037    | 0.39404296 |
| 8          | 100,000,039    | 0.38891601 |
| 9          | 1,000,000,007  | 0.41308593 |
| 9          | 1,000,000,009  | 0.40698242 |
| 9          | 1,000,000,021  | 0.41186523 |
| 10         | 10,000,000,019 |            |
| 10         | 10,000,000,033 |            |
| 10         | 10,000,000,061 |            |

Which can be summarized:

| log(prime) | average (ms) | difference  |
| ---------- | ------------ | ----------- |
| 3          | 0,159667963  |             |
| 4          | 0,197835283  | 1,239041817 |
| 5          | 0,238688147  | 1,20649938  |
| 6          | 0,260742187  | 1,09239688  |
| 7          | 0,324300127  | 1,243757793 |
| 8          | 0,38492838   | 1,186951063 |
| 9          | 0,410644527  | 1,066807614 |
| 10         |              |             |

how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

${\mathrm\Theta(\log\;n)}$ growth means that when the prime are ten times larger, the time will increase by a constant amount: ${\log(100)-\log(10)=1}$




Issues with 10
```
1.           . random: contract violation
  expected: (or/c (integer-in 1 4294967087) pseudo-random-generator?)
  given: 10000000000
```
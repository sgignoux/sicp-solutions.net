---
title: "SICP - Solution: Exercise 1.23"
date: 2018-10-16T04:03:58+02:00
draft: false
type: posts
---

## Exercise 1.23

> The `smallest-divisor` procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the `smallest-divisor` procedure to use `(next test-divisor)` instead of `(+ test-divisor 1)`. With `timed-prime-test` incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

## Solution

The goal of this exercise is to try an improvement in the prime check program and see if we understand correctly how it impacted performance. The improvement is easy enough to write.

```scheme
(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))
```

Here too, the initial tests with only one run were very inconsistent from run to run. I decided to extend the program to run the computation for each prime 1000 times and measure the result.

### DrRacket

The raw data from DrRacket:

| log(prime) | prime          | time (µs) | time improved (µs) |
| ---------- | -------------- | --------- | ------------------ |
| 3          | 1,009          | 2.7290    | 1.7949             |
| 3          | 1,013          | 2.3569    | 1.6550             |
| 3          | 1,019          | 2.5908    | 1.7180             |
| 4          | 10,007         | 8.2800    | 4.9938             |
| 4          | 10,009         | 8.0849    | 5.1137             |
| 4          | 10,037         | 8.1027    | 4.8859             |
| 5          | 100,003        | 28.657    | 17.197             |
| 5          | 100,019        | 24.527    | 15.549             |
| 5          | 100,043        | 24.993    | 17.264             |
| 6          | 1,000,003      | 82.756    | 57.128             |
| 6          | 1,000,033      | 90.673    | 48.691             |
| 6          | 1,000,037      | 108.13    | 142.09             |
| 7          | 10,000,019     | 270.25    | 173.35             |
| 7          | 10,000,079     | 263.61    | 170.14             |
| 7          | 10,000,103     | 271.04    | 159.06             |
| 8          | 100,000,007    | 838.71    | 521.78             |
| 8          | 100,000,037    | 863.30    | 530.37             |
| 8          | 100,000,039    | 866.58    | 520.76             |
| 9          | 1,000,000,007  | 2914.6    | 1613.4             |
| 9          | 1,000,000,009  | 2822.6    | 1612.2             |
| 9          | 1,000,000,021  | 2668.6    | 1883.7             |
| 10         | 10,000,000,019 | 8208.6    | 5131.5             |
| 10         | 10,000,000,033 | 8195.4    | 5341.0             |
| 10         | 10,000,000,061 | 8150.0    | 5185.8             |

This data can be sumarized by averaging the time for each of the three prime in the same range of size:

| log(prime) | average  (µs) | average improved (µs) | speedup |
| ---------- | ------------- | --------------------- | ------- |
| 3          | 2,55891       | 1,72265               | 148,5%  |
| 4          | 8,15592       | 4,99788               | 163,2%  |
| 5          | 26,0598       | 16,6700               | 156,3%  |
| 6          | 93,8536       | 82,6389               | 113,6%  |
| 7          | 268,305       | 167,517               | 160,2%  |
| 8          | 856,200       | 524,306               | 163,3%  |
| 9          | 2801,96       | 1703,16               | 164,5%  |
| 10         | 8184,73       | 5219,44               | 156,8%  |

Looking at this table, we notice number ranging from 113,6% to 164,5%. Even if the data is noisy, it seems clear that this is below the expected 200%.

### Chicken Scheme (compiled)

In order to check the number, I compiled the program with Chicken Scheme on OS X and got these results:

| log(prime) | prime          | time (µs) | time improved (µs) |
| ---------- | -------------- | --------- | ------------------ |
| 3          | 1,009          | 4.0       | 2.0                |
| 3          | 1,013          | 3.0       | 2.0                |
| 3          | 1,019          | 3.0       | 3.0                |
| 4          | 10,007         | 11.0      | 6.0                |
| 4          | 10,009         | 12.0      | 7.0                |
| 4          | 10,037         | 12.0      | 7.0                |
| 5          | 100,003        | 35.0      | 20.0               |
| 5          | 100,019        | 34.0      | 20.0               |
| 5          | 100,043        | 33.0      | 21.0               |
| 6          | 1,000,003      | 114.0     | 66.0               |
| 6          | 1,000,033      | 113.0     | 63.0               |
| 6          | 1,000,037      | 111.0     | 66.0               |
| 7          | 10,000,019     | 353.0     | 204.0              |
| 7          | 10,000,079     | 348.0     | 208.0              |
| 7          | 10,000,103     | 350.0     | 212.0              |
| 8          | 100,000,007    | 1110.0    | 659.0              |
| 8          | 100,000,037    | 1096.0    | 649.0              |
| 8          | 100,000,039    | 1106.0    | 647.0              |
| 9          | 1,000,000,007  | 3530.0    | 2074.0             |
| 9          | 1,000,000,009  | 3573.0    | 2156.0             |
| 9          | 1,000,000,021  | 3617.0    | 2070.0             |
| 10         | 10,000,000,019 | 11311.0   | 6898.0             |
| 10         | 10,000,000,033 | 11205.0   | 6563.0             |
| 10         | 10,000,000,061 | 11353.0   | 6752.0             |

That can be averaged and sumarized by averaging the time for each of the three prime in the same range of size:

| log(prime) | average  (µs) | average improved (µs) | speedup |
| ---------- | ------------- | --------------------- | ------- |
| 3          | 3,3           | 2,3                   | 142,9%  |
| 4          | 11,7          | 6,7                   | 175,0%  |
| 5          | 34,0          | 20,3                  | 167,2%  |
| 6          | 112,7         | 65,0                  | 173,3%  |
| 7          | 350,3         | 208,0                 | 168,4%  |
| 8          | 1104,0        | 651,7                 | 169,4%  |
| 9          | 3573,3        | 2100,0                | 170,2%  |
| 10         | 11289,7       | 6737,7                | 167,6%  |

This is much less noisy and it seems that the real speedup is indeed closer to 167% than the 200% expected.

### Explanation of the performance

By looking at the code of the two version, we can see a few differences that could explain the lack of expected speedup.

```scheme
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))
```

```scheme
(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))

(define (find-divisor-improved n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor-improved
               n
               (next test-divisor)))))
```

The version for `find-divisor-improved` contains:
* one more function call
* an `if`
* the predicate `(= n 2)` 

To validate our hypothesys, let's try a few experiments.

#### Experiment 1: inline `next` in `find-divisor-improved` so that we can estimate the cost of the function call

```scheme
(define (find-divisor-improved-inlined n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor-improved-inlined
               n
               (if (= test-divisor 2)
                   3
                   (+ 2 test-divisor))))))
```
On DrRacket:

| log(prime) | average  (µs) | average inlined improved (µs) | speedup |
| ---------- | ------------- | ----------------------------- | ------- |
| 3          | 2,77498       | 1,55135                       | 178,9%  |
| 4          | 8,02994       | 4,32861                       | 185,5%  |
| 5          | 25,9759       | 13,0106                       | 199,7%  |
| 6          | 75,6673       | 47,2732                       | 160,1%  |
| 7          | 258,644       | 147,951                       | 174,8%  |
| 8          | 971,482       | 529,498                       | 183,5%  |
| 9          | 2497,69       | 1414,67                       | 176,6%  |
| 10         | 7896,57       | 4539,28                       | 174,0%  |

We are now around 179% for speedup. Better, but not yet there.

#### Experiment 2: using inlined `next` remove the `=` testing

We need to cheat a little to do that, but since we are running this on prime number, we will just skip the test with 2 and start with 3.

```scheme
(define (find-divisor-improved-inlined n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor-improved-inlined
               n
               (if #f
                   3
                   (+ 2 test-divisor))))))
```

On DrRacket:

| log(prime) | average  (µs) | average inlined improved (µs) | speedup |
| ---------- | ------------- | ----------------------------- | ------- |
| 3          | 2,43196       | 1,24796                       | 194,9%  |
| 4          | 7,53336       | 3,76611                       | 200,0%  |
| 5          | 23,2299       | 11,6736                       | 199,0%  |
| 6          | 79,3243       | 37,5333                       | 211,3%  |
| 7          | 252,649       | 133,449                       | 189,3%  |
| 8          | 787,866       | 382,167                       | 206,2%  |
| 9          | 2429,22       | 1227,92                       | 197,8%  |
| 10         | 7793,55       | 3915,27                       | 199,1%  |

We have almost 200% here!

The problem by doing that is that we probably triggered the optimization of [DrRacket JIT compiler](https://docs.racket-lang.org/guide/performance.html#%28tech._jit%29) for dead code optimization. It means that the `if` has probably be removed and our third hypothesis has been added here too.

#### Conclusion

The improved algorithm did cut down the number of steps by 2, but the reason that it didn't speedup the computation by 200% was because we added some new work for each step:

* one more function call
* an `if`
* the predicate `(= n 2)` 











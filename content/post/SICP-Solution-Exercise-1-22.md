---
title: "SICP - Solution: Exercise 1.22"
date: 2018-10-15T04:03:58+02:00
draft: false
---

**Exercise 1.22:** Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following `timed-prime-test` procedure, when called with an integer $n$, prints $n$ and checks to see if $n$ is prime. If $n$ is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

```scheme
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime)
                       start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```

Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of ${\mathrm\Theta(\sqrt n)}$, you should expect that testing for primes around 10,000 should take about $\sqrt {10}$ times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the ${\mathrm\Theta(\sqrt n)}$ prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

**Solution**

Since `runtime` is not part of DrRacket, you have to use [current-inexact-milliseconds](https://docs.racket-lang.org/reference/time.html#%28def._%28%28quote._~23~25kernel%29._current-inexact-milliseconds%29%29). The code, including the `search-for-primes` function is:

```scheme
#lang racket/base
(define (runtime) (current-inexact-milliseconds)) ; adapting to DrRacket

; --- Prime computation ---

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

(define (prime? n)
  (= n (smallest-divisor n)))

; --- Timing ---

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      "nothing"))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start-range end-range)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) end-range)
      (cond ((> start-range end-range)
             (newline) (display "done"))
            (else (timed-prime-test start-range)
                  (search-for-primes (+ 2 start-range) end-range)))))

(search-for-primes 10000000000 10000000090)
```

The current hardware are pretty fast and I extended the range of number to test:

| log(prime) | prime          | time (ms) |
| ---------- | -------------- | --------- |
| 3          | 1,009          | 0.006103  |
| 3          | 1,013          | 0.005859  |
| 3          | 1,019          | 0.006103  |
| 4          | 10,007         | 0.009033  |
| 4          | 10,009         | 0.009033  |
| 4          | 10,037         | 0.008056  |
| 5          | 100,003        | 0.025146  |
| 5          | 100,019        | 0.024902  |
| 5          | 100,043        | 0.023925  |
| 6          | 1,000,003      | 0.078857  |
| 6          | 1,000,033      | 0.074951  |
| 6          | 1,000,037      | 0.078857  |
| 7          | 10,000,019     | 0.232910  |
| 7          | 10,000,079     | 0.227050  |
| 7          | 10,000,103     | 0.228027  |
| 8          | 100,000,007    | 0.710937  |
| 8          | 100,000,037    | 0.785888  |
| 8          | 100,000,039    | 0.712890  |
| 9          | 1,000,000,007  | 2.448974  |
| 9          | 1,000,000,009  | 2.524902  |
| 9          | 1,000,000,021  | 2.509765  |
| 10         | 10,000,000,019 | 7.738037  |
| 10         | 10,000,000,033 | 7.796875  |
| 10         | 10,000,000,061 | 7.476074  |

By averaging the run of the 3 first prime numbers and taking successive ratio, you get:

| log(prime) | average (ms) | ratio       |
| ---------- | ------------ | ----------- |
| 3          | 0.006021667  |             |
| 4          | 0.008707333  | 1.446000554 |
| 5          | 0.024657667  | 2.831827578 |
| 6          | 0.077555     | 3.14526922  |
| 7          | 0.229329     | 2.956985365 |
| 8          | 0.736571667  | 3.211855747 |
| 9          | 2.494547     | 3.386699642 |
| 10         | 7.670328667  | 3.074838304 |

The ratio is pretty close to $\sqrt {10} = 3.16227766017$, although this is only average of 3 run.
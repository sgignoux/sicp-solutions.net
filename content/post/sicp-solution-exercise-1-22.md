---
title: "SICP - Solution: Exercise 1.22"
date: 2018-10-15T04:03:58+02:00
draft: false
type: posts
---

## Exercise 1.22

> Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following `timed-prime-test` procedure, when called with an integer $n$, prints $n$ and checks to see if $n$ is prime. If $n$ is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.
> 
> ```scheme
> (define (timed-prime-test n)
>   (newline)
>   (display n)
>   (start-prime-test n (runtime)))
> (define (start-prime-test n start-time)
>   (if (prime? n)
>       (report-prime (- (runtime)
>                        start-time))))
> (define (report-prime elapsed-time)
>   (display " *** ")
>   (display elapsed-time))
> ```
> 
> Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of ${\mathrm\Theta(\sqrt n)}$, you should expect that testing for primes around 10,000 should take about $\sqrt {10}$ times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the ${\mathrm\Theta(\sqrt n)}$ prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

## Solution

Since `runtime` is not part of DrRacket, you can use [current-inexact-milliseconds](https://docs.racket-lang.org/reference/time.html#%28def._%28%28quote._~23~25kernel%29._current-inexact-milliseconds%29%29). The code, including the `search-for-primes` function is:

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

The function `current-inexact-milliseconds` provides data in the microseconds scale, but our current hardware is pretty fast and this is not precise enough. I extended the code for computing the average time of 1000 runs.

### DrRacket has high variability

The initial test was done with DrRacket, using some variation of the code you can find [here](https://github.com/sgignoux/sicp-solutions.net/blob/master/solutions/chapter-1/Exercise-1-22_23_24.rkt):

| log(prime) |          prime | time (µs) |
| ---------- | -------------: | --------: |
| 3          |          1,009 |    2.8010 |
| 3          |          1,013 |    2.4858 |
| 3          |          1,019 |    2.3898 |
| 4          |         10,007 |    7.9331 |
| 4          |         10,009 |    7.9948 |
| 4          |         10,037 |    7.8310 |
| 5          |        100,003 |    44.663 |
| 5          |        100,019 |    26.879 |
| 5          |        100,043 |    24.563 |
| 6          |      1,000,003 |    81.736 |
| 6          |      1,000,033 |    78.949 |
| 6          |      1,000,037 |    79.261 |
| 7          |     10,000,019 |    284.77 |
| 7          |     10,000,079 |    254.29 |
| 7          |     10,000,103 |    302.63 |
| 8          |    100,000,007 |    847.27 |
| 8          |    100,000,037 |    854.13 |
| 8          |    100,000,039 |    887.25 |
| 9          |  1,000,000,007 |    2612.4 |
| 9          |  1,000,000,009 |    2616.5 |
| 9          |  1,000,000,021 |    2625.0 |
| 10         | 10,000,000,019 |    8438.9 |
| 10         | 10,000,000,033 |    8096.1 |
| 10         | 10,000,000,061 |    8052.0 |

By averaging the run of the first 3 prime numbers and taking successive ratio, you get:

| log(prime) | average (µs) |      ratio |
| ---------- | -----------: | ---------: |
| 3          |          2.5 |            |
| 4          |          7.9 | 3.09493067 |
| 5          |         28.7 | 3.62414583 |
| 6          |         79.9 | 2.78665172 |
| 7          |        280.6 | 3.50784409 |
| 8          |        862.8 | 3.07552274 |
| 9          |       2618.0 | 3.03400981 |
| 10         |       8195.7 | 3.13058518 |

The ratio is pretty close to $\sqrt {10} = 3.162$, although this is only an average of 3 run.


### Chicken Scheme, with compiled code, is less variable

I wanted to compare to another implementation and managed to get the program compiled with [Chicken Scheme](https://www.call-cc.org/). The results are somewhat more consistent based on the code from [here](https://github.com/sgignoux/sicp-solutions.net/blob/master/solutions/chapter-1/Exercise-1-22_23_24.scm):

| log(prime) |          prime | time (µs) |
| ---------- | -------------: | --------: |
| 3          |          1,009 |       4.0 |
| 3          |          1,013 |       3.0 |
| 3          |          1,019 |       4.0 |
| 4          |         10,007 |      11.0 |
| 4          |         10,009 |      12.0 |
| 4          |         10,037 |      11.0 |
| 5          |        100,003 |      35.0 |
| 5          |        100,019 |      34.0 |
| 5          |        100,043 |      36.0 |
| 6          |      1,000,003 |     111.0 |
| 6          |      1,000,033 |     108.0 |
| 6          |      1,000,037 |     114.0 |
| 7          |     10,000,019 |     341.0 |
| 7          |     10,000,079 |     353.0 |
| 7          |     10,000,103 |     342.0 |
| 8          |    100,000,007 |    1105.0 |
| 8          |    100,000,037 |    1073.0 |
| 8          |    100,000,039 |    1080.0 |
| 9          |  1,000,000,007 |    3439.0 |
| 9          |  1,000,000,009 |    3471.0 |
| 9          |  1,000,000,021 |    3494.0 |
| 10         | 10,000,000,019 |   11129.0 |
| 10         | 10,000,000,033 |   11193.0 |
| 10         | 10,000,000,061 |   11224.0 |

The table can be summarized as above:

| log(prime) | average (µs) | ratio |
| ---------- | -----------: | ----: |
| 3          |          3.6 |       |
| 4          |           11 | 3.090 |
| 5          |           35 | 3.088 |
| 6          |          111 | 3.171 |
| 7          |          345 | 3.111 |
| 8          |         1086 | 3.144 |
| 9          |         3468 | 3.193 |
| 10         |        11182 | 3.224 |

The ratio here is also close to $\sqrt {10} = 3.162$, although this is only an average of 3 runs.

### Conclusion

The timing data seems to confirm that, for the range of value tested, the speed increase by $\sqrt {10}$ when testing with a number that has one more digit.

The variation in speed might be due to interaction with garbage collection. [This article](https://blog.janestreet.com/core_bench-micro-benchmarking-for-ocaml/) about micro-benchmarks could be a clue.
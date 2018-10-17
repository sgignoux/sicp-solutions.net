---
title: "SICP - Solution: Exercise 1.23"
date: 2018-10-16T04:03:58+02:00
draft: false
---

**Exercise 1.23:** The `smallest-divisor` procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the `smallest-divisor` procedure to use `(next test-divisor)` instead of `(+ test-divisor 1)`. With `timed-prime-test` incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

**Solution**

```scheme
(define (next n)
  (if (= n 2)
      3
      (+ 2 n)))
```

Running this and putting the timing in the "time next" column:

Average over 1000 runs

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

That can be averaged and sumarized by averaging the time for each of the three prime in the same range of size:

| log(prime) | average  (µs) | average improved (µs) | speedup |
| ---------- | ------------- | --------------------- | ------- |
| 3          | 2,558919271   | 1,72265625            | 148,5%  |
| 4          | 8,155924479   | 4,997884115           | 163,2%  |
| 5          | 26,05989583   | 16,67008464           | 156,3%  |
| 6          | 93,85367839   | 82,6389974            | 113,6%  |
| 7          | 268,3053385   | 167,5176595           | 160,2%  |
| 8          | 856,2000326   | 524,3069661           | 163,3%  |
| 9          | 2801,963379   | 1703,166097           | 164,5%  |
| 10         | 8184,732015   | 5219,449951           | 156,8%  |

Still noisy

With larger number, and more accurate runtime number, it seems that we are slower than the expected 200%.

Explanation
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

| log(prime) | prime          | time (ms) | time next (ms) |
| ---------- | -------------- | --------- | -------------- |
| 3          | 1,009          | 0.006103  | 0.002929       |
| 3          | 1,013          | 0.005859  | 0.001953       |
| 3          | 1,019          | 0.006103  | 0.002197       |
| 4          | 10,007         | 0.009033  | 0.006835       |
| 4          | 10,009         | 0.009033  | 0.007080       |
| 4          | 10,037         | 0.008056  | 0.007080       |
| 5          | 100,003        | 0.025146  | 0.016113       |
| 5          | 100,019        | 0.024902  | 0.015869       |
| 5          | 100,043        | 0.023925  | 0.015136       |
| 6          | 1,000,003      | 0.078857  | 0.047851       |
| 6          | 1,000,033      | 0.074951  | 0.047851       |
| 6          | 1,000,037      | 0.078857  | 0.046875       |
| 7          | 10,000,019     | 0.232910  | 0.157958       |
| 7          | 10,000,079     | 0.227050  | 0.159912       |
| 7          | 10,000,103     | 0.228027  | 0.156982       |
| 8          | 100,000,007    | 0.710937  | 0.479980       |
| 8          | 100,000,037    | 0.785888  | 0.473876       |
| 8          | 100,000,039    | 0.712890  | 0.466064       |
| 9          | 1,000,000,007  | 2.448974  | 1.576171       |
| 9          | 1,000,000,009  | 2.524902  | 1.504882       |
| 9          | 1,000,000,021  | 2.509765  | 1.520996       |
| 10         | 10,000,000,019 | 7.738037  | 4.608886       |
| 10         | 10,000,000,033 | 7.796875  | 4.656982       |
| 10         | 10,000,000,061 | 7.476074  | 4.621093       |

That can be averaged and sumarized:

| log(prime) | average  (ms) | average next (ms) | speedup |
| ---------- | ------------- | ----------------- | ------- |
| 3          | 0.006021667   | 0.002359667       | 255.2%  |
| 4          | 0.008707333   | 0.006998333       | 124.4%  |
| 5          | 0.024657667   | 0.015706          | 157.0%  |
| 6          | 0.077555      | 0.047525667       | 163.2%  |
| 7          | 0.229329      | 0.158284          | 144.9%  |
| 8          | 0.736571667   | 0.473306667       | 155.6%  |
| 9          | 2.494547      | 1.534016333       | 162.6%  |
| 10         | 7.670328667   | 4.628987          | 165.7%  |

With larger number, and more accurate runtime number, it seems that we are a little bit slower than the expected 200%.
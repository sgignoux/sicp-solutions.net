---
title: "SICP - Solution: Exercise 1.7"
date: 2018-09-29T21:03:58+02:00
draft: false
type: posts
---

## Exercise 1.7

> The `good-enough?` test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

## Solution

First, let's experiment with a few cases of very large values:

```scheme
(sqrt 123456789012)
> 351364.1828815225

(sqrt 1234567890123)
> 1111111.1061109055

(sqrt 9234567890124) ; does not finish

(sqrt 12345678901234) ; does not finish

(sqrt 123456789012345) ; does not finish
```

And for very small values:

```scheme
; First test
(sqrt 0.000123)
> 0.03254988507909497

(square (sqrt 0.000123))
> 0.001059495018662289 ; should be close to 0.000123

; Second test
(sqrt 0.00000000123)
> 0.031250013107186406

(square (sqrt 0.00000000123))
> 0.000976563319199322 ; should be close to 0.00000000123
```

From this, we can see two problems:

- for large numbers, there is a threshold, around 13 digits or more, when computations don't finish
- for small numbers, the result can be very inaccurate, sometime by multiple orders of magnitude, when numbers are below 0.001.

Let's look at each case separately.

### Large numbers

This is an interesting exercise because it forces us to look at how computers handle certain kinds of numbers "behind the scenes". More specifically, how real numbers are encoded in computers using "floating-point" format.

The benefit of using floating-point format, compared to an integer format, to store numbers is that it can represent a wider range of values compared, from very small to very large. In DrRacket, that I used to run the test, it uses [a double-precision floating-point format](https://en.wikipedia.org/wiki/Double-precision_floating-point_format) that stores the numbers in 64 bits. It allows from 15 to 17 significant decimal digits precision, meaning that it can store and compute on numbers like 999,999,999,999,999.9 and 0.000000000000001. This is a very wide range, but the system comes with a few limitations to keep in mind:

- Because each number is encoded on a finite number of bits (64 bits in our example), the number of floating-point numbers that can be represented in a computer is finite.
- Most of the time, a floating-point number will be the approximation of a real number. During computation, the results will be rounded to the nearest floating-point number.
- As the number of digits of the number represented increases, the size of the "gap" between two consecutive numbers will increase. Intuitively, the more decimal is used in the integer part (before the decimal point), the less digit will be available for the fractional part (after the decimal point).

> Squeezing infinitely many real numbers into a finite number of bits requires an approximate representation. Although there are infinitely many integers, in most programs the result of integer computations can be stored in 32 bits. In contrast, given any fixed number of bits, most calculations with real numbers will produce quantities that cannot be exactly represented using that many bits. Therefore the result of a floating-point calculation must often be rounded in order to fit back into its finite representation. This rounding error is the characteristic feature of floating-point computation.
>
> -- [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf)

If you want to learn more about how these number encoding works, you can have a quick look at look at [IEEE Standard 754 Floating Point Numbers - GeeksforGeeks](https://www.geeksforgeeks.org/ieee-standard-754-floating-point-numbers/) or a long look at [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://www.itu.dk/~sestoft/bachelor/IEEE754_article.pdf). Some of what I write below assume you have some knowledge of how numbers are stored in a computer.

In order to understand what happens, we can trace the program step by step for `(sqrt 12345678901234)`. We notice that after iteration 26 `(improve guess x)` is just returning the same value as `guess` and don't seem to be able to improve the result anymore.

| iteration |               guess |   (improve guess x) |
| --------- | ------------------: | ------------------: |
| 0         |             1.00000 | 6172839450617.50000 |
| 1         | 6172839450617.50000 | 3086419725309.75000 |
| 2         | 3086419725309.75000 | 1543209862656.87500 |
| 3         | 1543209862656.87500 |  771604931332.43750 |
| ...       |                 ... |                 ... |
| 22        |       4224503.31128 |       3573450.52229 |
| 23        |       3573450.52229 |       3514142.33663 |
| 24        |       3514142.33663 |       3513641.86446 |
| 25        |       3513641.86446 |       3513641.82882 |
| 26        |       3513641.82882 |       3513641.82882 |
| 27        |       3513641.82882 |       3513641.82882 |

We also notice that the best guess the program converge to can't satisfy the current implementation of `good-enough?`. Because `(- (square 3513641.86446) 12345678901234) = 0.00195312 > 0.001`, the program gets stuck on a value `guess`that is not good enough to satisfy the exit condition, thus making an infinite loop.

To understand why `(improve guess x)` can't provide a better result, we need to dive deeper into how the floating-point numbers are actually represented in the computer and execute step by step `(improve 3513641.8288200637 12345678901234)` to see what is happening.

```scheme
(define (improve guess x)
  (average guess (/ x guess)))
```

```
x           = 12345678901234
guess       = 3513641.8288200637
(\ x guess) = 3513641.8288200633
```

Both numbers are very close to each other. Then computing `(average 3513641.8288200637 3513641.8288200633)`:

```scheme
(define (average x y) 
  (/ (+ x y) 2))
```

```
(+ x y)        = 7027283.6576401274
(/ (+ x y) 2)) = 3513641.8288200637 ; same as guess

```

By using a tool like [IEEE-754 floating point numbers converters](https://numeral-systems.com/ieee-754-converter/), it is possible to look at how the numbers are actually encoded in the memory of the computer as 64 bits numbers:

```
              S Exponent    Mantissa
guess       = 0 10000010100 10101100111010010100111010100001011011000110100111**10** (3513641.8288200637)
(\ x guess) = 0 10000010100 10101100111010010100111010100001011011000110100111**01** (3513641.8288200633)
```

What is interesting is that these two numbers are not only very close to each other, but their floating-point representation in binary is almost the same. Only the last two digits are different: these two numbers are actually following each other! It means that there is no floating-point numbers between these two numbers, we have "run out of precision".

Since `improve` is computing the average of `guess` and `(/ x guess)`, the computer will add the two numbers and divide by two, but since there is no way to represent a number of floating point between these two numbers, the result will be rounded to the closest floating-point number, which is `guess`, thus explaining why `(improve guess x)` can't produce a better result.

Now that we have understood why the guess can't get better, we can look at why `good-enough?` returns false in this case. When compute `good-enough?` for both `guess` and  `(\ x guess)` who are consecutive floating-point numbers and we see that:

```
(square guess)       = 12345678901234.00195
(square (\ x guess)) = 12345678901233.99804

(abs (- (square guess) x))       = 0.00195 ; > 0.001
(abs (- (square (\ x guess)) x)) = 0.00195 ; > 0.001

```

Because we have run out of precision, and are using large numbers, `(- (square guess) x))` can't be below `0.001`, thus making the infinite loop.

I mentioned above that a 64-bits floating-point number has "from 15 to 17 significant decimal digits precision". Since "12345678901234" has 14 significant decimal digits and "0.001" has 3 significant decimal digits, and 14 + 3 = 17, we can get a sense of why the problem happens. We are asking for a very precise solution for a very large number. Here, like the problem with small numbers, the issue is that the precision required is absolute and not relative to the scale of the numbers.

If we are very lucky, `guess` will converge to a fixed point where the rounded results of `(- (square guess) x)` is evaluated to exactly `0.0` and the evaluation stops.

If we are not lucky, the gap between two consecutive floating-point numbers of `guess` have a `(square guess)` larger than `0.001` and the assertion `good-enough?` will never evaluate to true.

Increasing the precision to `0.00000001` will even makes things worse, as it triggers issues with an even smaller number for x.

### Small numbers

The problem with small numbers is different. Looking at the trace for `(sqrt 0.00000000123)`, we see that the computation seems to stop too early:

| iteration |    guess | (improve guess x) | (- (square guess) x) |
| --------- | -------: | ----------------: | -------------------: |
| 0         | 1.000000 |          0.500000 |             1.000000 |
| 1         | 0.500000 |          0.250000 |             0.250000 |
| 2         | 0.250000 |          0.125000 |             0.062500 |
| 3         | 0.125000 |          0.062500 |             0.015625 |
| 4         | 0.062500 |          0.031250 |             0.003906 |
| 5         | 0.031250 |          0.015625 |             0.000977 |

The number of digits of precision is hardcoded to `0.001`. It means that the program will be ok with inaccurate answer when trying to compute a square root of numbers around or smaller than the precision of `0.001`. It is like giving a distance with an uncertainty of "more or less 0.001 kilometers". It is fine if you measure distance between cities, but won't make any sense if you are measuring the size of atoms.

### Alternative Strategy

The first step is to redefine `good-enough?` based on the idea of looking at the difference between the guess and the improved guess becoming small. To do that, the definition of `good-enough?` is updated by computing the difference between the `previous-guess` and `guess` and divided by `guess` to get a relative rate of change that is not dependent on the scale of the numbers.

```scheme
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))
```

The number `0.00000000001` is somewhat arbitrary and based on a few trial and error. Then we just need to adapt the function `sqrt-iter` to provide the correct argument:

```scheme
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))
```

Although we could improve the code to avoid computing `(improve guess x)` twice, because the method to do this has not been explained in the book yet, I will not use it here.

The complete solution will look like:

```scheme
(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))
```

It is interesting to note that the new `good-enough?` does not depend on `x` anymore. The computation is iterating until it can't improve the result significantly anymore. In the case of large values, where `(improve guess x)` returned the same value as `guess`, `good-enough?` will return #t because `(- guess previous-guess)` becomes 0 and the loop finish immediately.

Now we can try large numbers:

```
(sqrt 123456789012345) = 11111111.061111081 - Error: 0.015625
```

and small numbers:

```
(sqrt 0.00000000123456) = 3.51363060095964e-05 - Error: 4.1359030627651384e-25
```

In both cases, the error is small _relative_ to the size of the number computed.

When computing with floating-point number, just remember that they are not your friends. Floating-point numbers are here to get you.

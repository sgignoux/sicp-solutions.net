---
title: "SICP - Chapter 1: Building Abstractions With Procedures [Solutions]"
date: 2018-09-27T21:03:58+02:00
draft: false
---

### Exercise 1.1

Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

**Solution:**

```scheme
10
> 10

(+ 5 3 4)
> 12

(- 9 1)
> 8

(/ 6 2)
> 3

(+ (* 2 4) (- 4 6))
> 6

(define a 3)
>

(define b (+ a 1))
>

(+ a b (* a b))
> 19

(= a b)
> #f

(if (and (> b a) (< b (* a b)))
    b
    a)
> 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
> 16

(+ 2 (if (> b a) b a))
> 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
> 16
```

### Exercise 1.2

**Solution:**

```scheme
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
```

### Exercise 1.3

Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

**Solution:**

```scheme
; Solution
(define (square x) (* x x))
(define (sum-square x y) (+ (square x) (square y)))

(define (fun x y z)
  (cond ((and (<= x y) (<= x z)) (sum-square y z))
        ((and (<= y x) (<= y z)) (sum-square x z))
        ((and (<= z x) (<= z y)) (sum-square x y))))

; Checks
(= (fun 10 10 10) (sum-square 10 10))

(= (fun 1 10 10) (sum-square 10 10))
(= (fun 10 1 10) (sum-square 10 10))
(= (fun 10 10 1) (sum-square 10 10))

(= (fun 1 10 100) (sum-square 10 100))
(= (fun 1 100 10) (sum-square 10 100))
(= (fun 10 1 100) (sum-square 10 100))
(= (fun 10 100 1) (sum-square 10 100))
(= (fun 100 10 1) (sum-square 10 100))
(= (fun 100 1 10) (sum-square 10 100))
```

### Exercise 1.4

Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

**Solution:**

If `b` is strictly a positive number return `a+b`, else return `a-b`.

In other word, return `a + |b|`

### Exercise 1.5

Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
```

Then he evaluates the expression

```scheme
(test 0 (p))
```

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.

**Solution:**

The key is to notice that `(define (p) (p))` defines a function that evaluate to itself.

With an interpreter that uses **applicative-order evaluation**, the interpreter will “evaluate the arguments and then apply”. If we apply the first rule for evaluating a combination to `(test 0 (p))` will start by evaluating `0` as `0`, then it will try to evaluate `(p)`.

When `(p)` is evaluated, the system replace each formal parameters by the corresponding argument in the body of the procdure: since there is no formal parameter in this case, the body of the procedure will just be `(p)`. Then the evaluation of the body of the procedure will be done on `(p)`, which in turn will evaluate to the same things, thus making an infinite loop.

With an interpreter that uses **normal-order evaluation**, the interpreter will “fully expand and then reduce”. In this model, we would not evaluate the operands until their values were needed. In that case `(test 0 (p))` will evaluate as follow:

```scheme
(test 0 (p))
```

will expand to:

```scheme
(if (= 0 0)
    0
    (p)
```

Since `(= 0 0)` evaluates to `#t` in the `if`, there will be no attempt to evaluate `(p)` and the result will be:

```scheme
0
```

### Exercise 1.6

Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```scheme
(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```scheme
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
```

Delighted, Alyssa uses new-if to rewrite the square-root program:

```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.

**Solution:**

Since `new-if` is a function, each parameters subexpressions will be evaluated _before_ the procedure is applied. It means that when evaluating:

```scheme
(new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))
```

The system will evaluate all this expression, in this order, before trying to apply the function `new-if`:

- `new-if`: which is the procedure defined above
- `(good-enough? guess x)`: which return `#t` or `#f`
- `guess`: which is the value parameter
- `(sqrt-iter (improve guess x) x)`: which will call the current procedure recursively.

Whatever the expression `(good-enough? guess x)` is evaluating to, the `(sqrt-iter (improve guess x) x)))` will be evaluated. The stop condition for the loop is not taken into consideration.

With a normal `if` as a special form, first `(good-enough? guess x)` is evaluated and then one and only one of the alternative will be evaluated.

### Exercise 1.7

The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

**Solution:**

Number in computer can be encoded in different ways. Integer can be represented exactly up to a certain point, but real number and very large integer are usually represented in a format call "floating point".

Key points about floating points numbers:

- because each number is encoded on a finite number of bit, the number of floating point number that can be represented in a computer is finite.
- most of the time, are an approximation of the real number. This causes rounding issues.
- as the number represented increases, the size of the "gap" between two consecutive number will grow by step.

> Squeezing infinitely many real numbers into a finite number of bits requires an approximate representation. Although there are infinitely many integers, in most programs the result of integer computations can be stored in 32 bits. In contrast, given any fixed number of bits, most calculations with real numbers will produce quantities that cannot be exactly represented using that many bits. Therefore the result of a floating-point calculation must often be rounded in order to fit back into its finite representation. This rounding error is the characteristic feature of floating-point computation.
>
> -- [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)

#### Large numbers

For number above a certain number of digits, the computation of the square root will never complete. For example, on my system and using DrRacket, `(sqrt 12345678901234)` does not complete.

Question: do all number above a certain size create an infinite loop or are they "exact number" than can be computed?

Case where `(improve guess x)` can't improve the guess as it ran "out of precision".

The issue comes directly from how a floating point number is represented. This is because the "space" between number is larger than the space of the precision we ask. The improve guess procedure will not be able to generate a new guess, as it runs out of precision.

A quick way to test this is by adding a small number to a large number and see that, from the point of the computer, the large number and the large number added to the small number are identical:

```scheme
(define a-large-number 123456789012345)
(= a-large-number (+ a-large-number 0.001))
> #t
```

Once both the guess become close to the result and the result is on a size where two consecutive number are space by more than `0.001`, the assertion `good-enough?` will never become true.

The substraction of this two number will always give a number larger than `0.001`. Even if you increase the precision to `0.00000001`, it will change nothing.

```
sqrt(123456789012345) => never complete
```

But other number can complete, like:

```
sqrt(12345678901234000) = 111111110.61110856 - Error: 0.0
```

#### Small numbers

Can't have precision if the number is smaller than the precision of `0.001`.

```
sqrt(0.00000000123456) = 0.0312500131557789 - Error: 0.0009765620876763541
```

#### Alternative strategy

The first step is to redefine the good-enough?` based on the definition in the problem statement:

```scheme
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))
```

The number `0.00000000001` is based on a few trial and error for the upcoming tests. Then just need to adapt the function `` to provide the correct arguement:

```scheme
(define (sqrt-iter guess x nth)
  (if (or (good-enough? guess (improve guess x)) (> nth 32))
      guess
      (sqrt-iter (improve guess x) x (+ nth 1))))
```

Although we could improve the code to avoid computing `(improve guess x)` twice, this was not learned becore this exercice.

The complete solution will look like:

```scheme
(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x nth)
  (if (or (good-enough? guess (improve guess x)) (> nth 32))
      guess
      (sqrt-iter (improve guess x) x (+ nth 1))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x 0))
```

Now we can try large number:

```
sqrt(123456789012345) = 11111111.061111081 - Error: 0.015625
```

and small number:

```
sqrt(0.00000000123456) = 3.51363060095964e-05 - Error: 4.1359030627651384e-25
```

In both cases, the error is small relative to the size of the number computed.

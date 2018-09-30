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

Translate the following expression into prefix form:

$${\frac{5+4+(2-(3-(6+\frac45)))}{3(6-2)(2-7)}.}$$

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

Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

**Solution:**

If $b$ is strictly a positive number return $a+b$, else return $a-b$.

In other word, this function compute ${a+\left|b\right|.}$

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

When `(p)` is evaluated, the system replace each formal parameters by the corresponding argument in the body of the procedure: since there is no formal parameter in this case, the body of the procedure will just be `(p)`. Then the body of the procedure `(p)` will be done evaluated, which in turn start the evaluation all over again, thus making an infinite loop.

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

the condition and all the alternatives of the if will always be evaluated, whatever `(good-enough? guess x)` is true or false. Since the second alternative is calling the function itself recursively, the function will stuck in an infinite loop.

### Exercise 1.7

The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

**Solution:**

First, lets experiment with a few cases:

```scheme
(sqrt 1234567890123)
> 1111111.1061109055

(sqrt 12345678901234)
does not complete

(sqrt 12345678901230)
> 3513641.828819494

(sqrt 0.00000000123)
> 0.031250013107186406

(square (sqrt 0.00000000123))
> 0.000976563319199322
```

From that experiments, we can see two problems:

- With large numbers, sometime the computation doesn't complete
- With small number, the result can be very inaccurate, by multiple order of magnitude

In order to understand more what is happening, we need to look at how real numbers can be encoded in computers, more specifically "floating point" encoding in this case.

Key points about floating points numbers:

- because each number is encoded on a finite number of bit, the number of floating point number that can be represented in a computer is finite.
- most of the time, are an approximation of the real number. This causes rounding issues.
- as the number represented increases, the size of the "gap" between two consecutive number will grow by step.

> Squeezing infinitely many real numbers into a finite number of bits requires an approximate representation. Although there are infinitely many integers, in most programs the result of integer computations can be stored in 32 bits. In contrast, given any fixed number of bits, most calculations with real numbers will produce quantities that cannot be exactly represented using that many bits. Therefore the result of a floating-point calculation must often be rounded in order to fit back into its finite representation. This rounding error is the characteristic feature of floating-point computation.
>
> -- [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)

#### Large numbers

For some numbers above a certain size of digits, the computation of the square root will never complete.

When tracing the program step by step, we can see that this condition happens for large number, when the guess is getting very close to the actual result. Because of rounding errors, the function `(improve guess x)` can't improve the guess anymore as the difference between $guess^2$ and $x$ becomes so small that it is bellow the distance between two consecutive floating point numbers.

If we are lucky, the rounding errors gives that `(- (square guess) x)` is exactly `0.0` and stop the evaluation. If we are not lucky, and the gap between two consecutive number is more than `0.001`, the assertion `good-enough?` will never become true since `improve` has reached a fixed point due to the rounding error and will return always the same number that is larger than `0.001`. For example:

```scheme
(improve 3513641.8288200637 12345678901234) -> 3513641.8288200637
```

The substraction of this two number will always give a number larger than `0.001`. Even if you increase the precision to `0.00000001` since this is a limitation of the precision of the floating point number used.

#### Small numbers

We have hardcoded the number of digit of precision we want. Can't have precision if the number is smaller than the precision of `0.001`.

```
sqrt(0.00000000123456) = 0.0312500131557789 - Error: 0.0009765620876763541
```

It is like asking to measure the size of a coin, plus or minus one meter. The result can be technically correct, it is still not very usefull.

#### Alternative strategy

The first step is to redefine `good-enough?` based on the definition in the problem statement:

```scheme
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))
```

The number `0.00000000001` is based on a few trial and error for the upcoming tests. Then we just need to adapt the function `sqrt-iter` to provide the correct arguement:

```scheme
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))
```

Although we could improve the code to avoid computing `(improve guess x)` twice, the method to do this was not learned for before this exercice.

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

It is interesting to note that the new `good-enough?` does not depend on `x` anymore.

Now we can try large number:

```
sqrt(123456789012345) = 11111111.061111081 - Error: 0.015625
```

and small number:

```
sqrt(0.00000000123456) = 3.51363060095964e-05 - Error: 4.1359030627651384e-25
```

In both cases, the error is small _relative_ to the size of the number computed.

### Exercise 1.8

Newton’s method for cube roots is based on the fact that if $y$ is an approximation to the cube root of $x$, then a better approximation is given by the value

$${\frac{{x/y^2}+2y}3.}$$

Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

**Solution:**

Using the same improvement for large and small number from exercice 1.7:

```scheme
(define (cube x) (* x x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (cube-root-iter guess x)
  (if (good-enough? (improve guess x) guess)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))


(define (cube-root x)
  (cube-root-iter 1.0 x))
```

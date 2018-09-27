---
title: "SICP - Chapter 1: Building Abstractions With Procedures"
date: 2018-09-27T21:03:58+02:00
draft: false
---

## 1.1 The Elements of Programming

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

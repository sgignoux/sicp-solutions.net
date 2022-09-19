---
title: "SICP - Solution: Exercise 1.5"
date: 2018-09-27T21:03:58+02:00
draft: false
type: posts
---

## Exercise 1.5

> Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
> 
> ```scheme
> (define (p) (p))
> 
> (define (test x y)
>   (if (= x 0)
>       0
>       y))
> ```
> 
> Then he evaluates the expression
> 
> ```scheme
> (test 0 (p))
> ```
> 
> What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.

## Solution

The key is to notice that `(define (p) (p))` defines a function that evaluates to itself.

An interpreter that uses **applicative-order evaluation** will “evaluate the arguments and then apply”. When this kind of interpreter evaluates the expression `(test 0 (p))`, it will start by evaluating `0`, then it will try to evaluate `(p)` and finaly apply `test` to the values of the evaluation of the two parameters.

`test` will evaluate to the procedure defined.

`0` will evaluate to the number O.

`(p)` will evaluate to `(p)`, which will evaluate to `(p)`

> To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument.


When the interpreter try to evaluate the expression `(p)`, it will:

1. replace each formal parameters by the corresponding argument in the body of the procedure: since there is no formal parameter in this case, the body of the procedure will just be `(p)`.
2. evaluated the body of the procedure, which will be `(p)` in our case, which in turn starts the evaluation all over again, thus making an infinite loop.

With an interpreter that uses **normal-order evaluation**, the interpreter will “fully expand and then reduce”. In this model, the interpreter will not evaluate the operands until their values are actually needed. In that case `(test 0 (p))` will evaluate as follows:

```scheme
(test 0 (p))
```

will be expanded to:

```scheme
(if (= 0 0)
    0
    (p))
```

Since the predicate `(= 0 0)` evaluates to `#t` in the `if`,  then `(p)` will not be evaluated and the result will be:

```scheme
0
```

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
> (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)

## Solution

The key of the exercise is to notice that `(define (p) (p))` defines a function named `p` that doesn't have any formal parameter and that evaluates to itself.

We also need to keep in mind how the interpreter evaluates combinations:

> To evaluate a combination, do the following:
> 1. Evaluate the subexpressions of the combination.
> 2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).

And how the interpreter evaluates compound procedures:

> To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument.

An interpreter that uses **applicative-order evaluation** will “evaluate the arguments and then apply”. When this kind of interpreter evaluates the expression `(test 0 (p))`, it will perform the evaluation process on each element of the combination.

It starts by evaluating the symbol `test` that returns the compound procedure previously defined.

Then it evaluates `0` that returns the numeral O.

Finally, it tries to evaluate the argument `(p)` and this is where things are getting tricky. When the interpreter evaluates the expression `(p)`, we can look at the rules mentioned above and follow step by step:

1. "Evaluate the subexpressions of the combination." The symbol `p` will evaluate to the compound procedure defined and since there is no other subexpression here, there is nothing more to do.

2. "Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands)." The operator is a compound procedure `f` and there is no argument.

3. "To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument." Since there is no formal parameter in this case, the body of the procedure that needs to be evaluated is just `(p)`, by its definition. But the interpreter has reached a step that, in order to interpret `(p)`, it has to evaluate `(p)` recursively.  The interpreter is in an infinite loop!

In conclusion, evaluating `(test 0 (p))` with an interpreter that uses **applicative-order evaluation** will result in an infinite loop.

When an interpreter uses **normal-order evaluation**, it will “fully expand and then reduce”. In this model, the interpreter will not evaluate the operands until their values are actually needed. In that case, the expression `(test 0 (p))` will be expanded to:

```scheme
(if (= 0 0)
    0
    (p))
```

Since the predicate `(= 0 0)` evaluates to `#t` in the `if` expression,  then the alternative `(p)` will not be evaluated and the result will be:

```scheme
0
```


---
title: "SICP - Solution: Exercise 1.20"
date: 2018-10-14T02:03:58+02:00
draft: false
type: posts
---

## Exercise 1.20

> The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative `gcd` procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in 1.1.5. (The normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating `(gcd 206 40)` and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of `(gcd 206 40)`? In the applicative-order evaluation?

## Solution



```scheme
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```

### Normal-order evaluation

With an interpreter that uses **normal-order evaluation**, the interpreter will “fully expand and then reduce”.

From Exercise 1.5: "the evaluation rule for the special form `if` is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression."

```
(gcd 206 40)
```

Which expands to:

```
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
```

The `if` needs to be evaluated, making the next step of the computation:

```
(gcd 40 (remainder 206 40))
```

Which expands to:

```
(if (= (remainder 206 40) 0) ; 1 remainder evaluated
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))
```

The `if` needs to be evaluated, forcing **1 remainder** to be computed and making the next step of the computation:

```
(if (= 6 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))
```

Then:

```
(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
```

Which expands to:

```
(if (= (remainder 40 (remainder 206 40)) 0) ; 2 remainders evaluated
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
```

The `if` needs to be evaluated, forcing **2 remainders** to be computed and making the next step of the computation:

```
(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
```

Then:

```
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
```

Which expands to:

```
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ; 4 remainders evaluated
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
```

The `if` needs to be evaluated, forcing **4 remainders** to be computed and making the next step of the computation:

```
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
```

Then:

```
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
```

Which expands to:

```
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ; 7 remainders evaluated
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
```

The `if` needs to be evaluated, forcing **7 remainders** to be computed and making the next step of the computation:

```
(if (= 0 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
```

Then:

```
(remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 4 remainders evaluated
```

Forcing **4 remainders** to be computed and returning the result:

```
> 2
```

Using **normal-order evaluation**, `remainder` is called $1+2+4+7+4=18$ times.

### Applicative-order evaluation

An interpreter that uses **applicative-order evaluation** will “evaluate the arguments and then apply”.

```
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40))) ; 1 remainder

(gcd 40 6)

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6))) ; 1 remainder

(gcd 6 4)

(if (= 4 0)
    6
    (gcd 4 (remainder 6 4))) ; 1 remainder

(gcd 4 2)

(if (= 2 0)
    4
    (gcd 2 (remainder 4 2))) ; 1 remainder

(gcd 2 0)

(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))

2
```

Using **applicative-order evaluation**, `remainder` is called 4 times.

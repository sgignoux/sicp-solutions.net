---
title: "SICP - Solution: Exercise 1.16"
date: 2018-10-11T21:06:58+02:00
draft: false
type: posts
---

**Exercise 1.16:** Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does `fast-expt`. (Hint: Using the observation that ${(b^{n/2})^2}={(b^2)^{n/2}}$, keep, along with the exponent $n$ and the base $b$, an additional state variable $a$, and define the state transformation in such a way that the product ${ab^n}$ is unchanged from state to state. At the beginning of the process $a$ is taken to be 1, and the answer is given by the value of $a$ at the end of the process. In general, the technique of defining an _invariant quantity_ that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

**Solution**

When $n$ is even, we can rewrite the equation $ab^n$ as:

$$ab^n=a{(b^{n/2})^2}=a{(b^2)^{n/2}}=a'b'^{n'}$$

$$a'=a$$
$$b'=b^2$$
$$n'=n/2$$

When $n$ is odd, we can rewrite the equation $ab^n$ as:

$$ab^n=abb^{n-1}=(ab)b^{n-1}=a'b'^{n'}$$

$$a'=ab$$
$$b'=b$$
$$n'=n-1$$

This can be implemented directly into:

```scheme
(define (fast-expt-iter a b n)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter a (* b b) (/ n 2)))
        (else
         (fast-expt-iter (* a b) b (- n 1)))))
```

We can check that this is tail recursive by using the [tracing function in DrRacket](https://docs.racket-lang.org/reference/debugging.html#%28mod-path._racket%2Ftrace%29):

```scheme
#lang racket/base
(require racket/trace)
...
(trace fast-expt-iter)
(fast-expt-iter 1 9 7)
```

Will evaluate to:

```
>(fast-expt-iter 1 9 7)
>(fast-expt-iter 9 9 6)
>(fast-expt-iter 9 81 3)
>(fast-expt-iter 729 81 2)
>(fast-expt-iter 729 6561 1)
>(fast-expt-iter 4782969 6561 0)
<4782969
```

The number of `>` is representing the depth of the stack.

That can be compared to the recursive version:

```scheme
#lang racket/base
(require racket/trace)

(define (expt-recurs b n)
  (if (= n 0)
      1
      (* b (expt-recurs b (- n 1)))))

(trace expt-recurs)
(expt-recurs 9 7)
```

Which return:

```
>(expt2 9 7)
> (expt2 9 6)
> >(expt2 9 5)
> > (expt2 9 4)
> > >(expt2 9 3)
> > > (expt2 9 2)
> > > >(expt2 9 1)
> > > > (expt2 9 0)
< < < < 1
< < < <9
< < < 81
< < <729
< < 6561
< <59049
< 531441
<4782969
```

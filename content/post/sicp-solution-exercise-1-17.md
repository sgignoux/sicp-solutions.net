---
title: "SICP - Solution: Exercise 1.17"
date: 2018-10-12T21:06:58+02:00
draft: false
type: posts
---

## Exercise 1.17

> The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the `expt` procedure:
> 
> ```scheme
> (define (* a b)
>   (if (= b 0)
>       0
>       (+ a (* a (- b 1)))))
> ```
> 
> This algorithm takes `a` number of steps that is linear in `b`. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to `fast-expt` that uses a logarithmic number of steps.

## Solution

An invariant when $b$ is even is:

$$a\times b=a\times\left(2\times\frac b2\right)=\left(2a\right)\times\left(\frac b2\right)=a'\times b'$$

$$a'=2a$$

$$b'=\frac b2$$

Which can be implemented like this:

```scheme
(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (fast-mult (double a) (halve b)))
        (else
         (+ a (fast-mult a (- b 1))))))

(fast-mult 17 19)
```

The trace for this process will be:

```
>(fast-mult 17 19)
> (fast-mult 17 18)
> (fast-mult 34 9)
> >(fast-mult 34 8)
> >(fast-mult 68 4)
> >(fast-mult 136 2)
> >(fast-mult 272 1)
> > (fast-mult 272 0)
< < 0
< <272
< 306
<323
```

If you compare to the trace of the original version you can clearly see the difference:

```
>(mult 17 19)
> (mult 17 18)
> >(mult 17 17)
> > (mult 17 16)
> > >(mult 17 15)
> > > (mult 17 14)
> > > >(mult 17 13)
> > > > (mult 17 12)
> > > > >(mult 17 11)
> > > > > (mult 17 10)
> > > >[10] (mult 17 9)
> > > >[11] (mult 17 8)
> > > >[12] (mult 17 7)
> > > >[13] (mult 17 6)
> > > >[14] (mult 17 5)
> > > >[15] (mult 17 4)
> > > >[16] (mult 17 3)
> > > >[17] (mult 17 2)
> > > >[18] (mult 17 1)
> > > >[19] (mult 17 0)
< < < <[19] 0
< < < <[18] 17
< < < <[17] 34
< < < <[16] 51
< < < <[15] 68
< < < <[14] 85
< < < <[13] 102
< < < <[12] 119
< < < <[11] 136
< < < <[10] 153
< < < < < 170
< < < < <187
< < < < 204
< < < <221
< < < 238
< < <255
< < 272
< <289
< 306
<323
```

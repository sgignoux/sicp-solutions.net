---
title: "SICP - Solution: Exercise 1.18"
date: 2018-10-12T21:02:58+02:00
draft: false
---

**Exercise 1.18:** Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

**Solution**

An invariant when $b$ is even is:

$$a\times b=a\times\left(2\times\frac b2\right)=\left(2a\right)\times\left(\frac b2\right)=a'\times b'$$

$$a'=2a$$

$$b'=\frac b2$$

$$c'=c$$

An invariant when $b$ is odd is:

$$a\times b+c=a\times(1+(b-1))+c=a\times(b-1)+\left(c+a\right)=a'\times b'+c'$$

$$a'=a$$

$$b'=(b-1)$$

$$c'=c+a$$

```scheme
(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (fast-mult-iter a b c)
  (cond ((= b 0)
         c)
        ((even? b)
         (fast-mult-iter (double a) (halve b) c))
        (else
         (fast-mult-iter a (- b 1) (+ c a)))))

(fast-mult-iter 17 19)
```

Which give a trace:

```
>(fast-mult-iter 17 19 0)
>(fast-mult-iter 17 18 17)
>(fast-mult-iter 34 9 17)
>(fast-mult-iter 34 8 51)
>(fast-mult-iter 68 4 51)
>(fast-mult-iter 136 2 51)
>(fast-mult-iter 272 1 51)
>(fast-mult-iter 272 0 323)
<323
```

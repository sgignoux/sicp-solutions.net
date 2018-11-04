---
title: "SICP - Solution: Exercise 1.19"
date: 2018-10-14T01:03:58+02:00
draft: false
---

**Exercise 1.19:** There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables $a$ and $b$ in the `fib-iter` process of 1.2.2: $a\leftarrow a+b$ and $b\leftarrow a$. Call this transformation $T$, and observe that applying $T$ over and over again $n$ times, starting with 1 and 0, produces the pair ${\text{Fib}(n+1)}$ and ${\text{Fib}(n)}$. In other words, the Fibonacci numbers are produced by applying $T^n$, the $n^{\text{th}}$ power of the transformation $T$, starting with the pair (1, 0). Now consider $T$ to be the special case of ${p=0}$ and ${q=0}$ in a family of transformations $T\_{pq}$, where $T\_{pq}$ transforms the pair ${(a,b)}$ according to $a\leftarrow{bq}+{aq}+{ap}$ and $b\leftarrow{bp}+{aq}$. Show that if we apply such a transformation $T\_{pq}$ twice, the effect is the same as using a single transformation $T\_{p'q'}$ of the same form, and compute $p′$ and $q′$ in terms of $p$ and $q$. This gives us an explicit way to square these transformations, and thus we can compute $T^n$ using successive squaring, as in the `fast-expt` procedure. Put this all together to complete the following procedure, which runs in a logarithmic number of steps:

```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   ⟨??⟩  ;compute p'
                   ⟨??⟩  ;compute q'
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))
```

**Solution**

To solve this problem, it is necessary expand $T\_{pq}\left(T\_{pq}(a,b)\right)$ and see if we can refactor it:

$$T\_{pq}(a,b)=(bq+aq+ap,\;bp+aq)$$

$$T\_{pq}\left(T\_{pq}(a,b)\right)=(\left(bp+aq\right)q+\left(bq+aq+ap\right)q+\left(bq+aq+ap\right)p,\;\left(\;bp+aq\right)p+\left(bq+aq+ap\right)q)$$

$$T\_{pq}\left(T\_{pq}(a,b)\right)=(bpq+aq^2+bq^2+aq^2+aqp+bqp+aqp+ap^2,\;bp^2+aqp+bq^2+aq^2+aqp)$$

Which can be rewritten as:

$$T\_{pq}\left(T\_{pq}(a,b)\right)=(b(2qp+q^2)+a(q^2+p^2)+a(2qp+q^2),\;b(p^2+q^2)+a(2qp+q^2))=T\_{p'q'}$$

$$p'=p^2+q^2$$

$$q'=2qp+q^2$$

```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))    ;compute p'
                   (+ (* 2 q p) (* q q))  ;compute q'
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))

(fib 17)
```

Which gives the trace:

```
>(fib-iter 1 0 0 1 17)
>(fib-iter 1 1 0 1 16)
>(fib-iter 1 1 1 1 8)
>(fib-iter 1 1 2 3 4)
>(fib-iter 1 1 13 21 2)
>(fib-iter 1 1 610 987 1)
>(fib-iter 2584 1597 610 987 0)
<1597
```

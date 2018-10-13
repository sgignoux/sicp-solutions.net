---
title: "SICP - Solution: Exercise 1.19"
date: 2018-10-13T21:03:58+02:00
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

TBD

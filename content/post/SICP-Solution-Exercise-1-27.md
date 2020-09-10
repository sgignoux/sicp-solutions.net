---
title: "SICP - Solution: Exercise 1.27"
date: 2018-10-20T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.27:** Demonstrate that the Carmichael numbers listed in Footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer $n$ and tests whether an is congruent to $a$ modulo $n$ for every ${a<n}$, and try your procedure on the given Carmichael numbers.

**Solution**

Let's just run the number and see:

```scheme
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (carmichael-number? n)
  (define (try-it n a)
    (cond ((= a 1) #t)
          ((not (= (expmod a n n) a)) #f)
          (else (try-it n (- a 1)))))
  (try-it n (- n 1)))

(display (carmichael-number? 561))  (newline)
(display (carmichael-number? 1105)) (newline)
(display (carmichael-number? 1729)) (newline)
(display (carmichael-number? 2465)) (newline)
(display (carmichael-number? 2821)) (newline)
(display (carmichael-number? 6601)) (newline)
```

Evaluates to:

```
#t
#t
#t
#t
#t
#t
```

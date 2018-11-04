---
title: "SICP - Solution: Exercise 1.28"
date: 2018-10-21T04:03:58+02:00
draft: false
---

**Exercise 1.28:** One variant of the Fermat test that cannot be fooled is called the _Miller-Rabin_ test (Miller 1976; Rabin 1980). This starts from an alternate form of Fermat’s Little Theorem, which states that if $n$ is a prime number and $a$ is any positive integer less than $n$, then $a$ raised to the $(n−1)$-st power is congruent to 1 modulo n. To test the primality of a number $n$ by the Miller-Rabin test, we pick a random number ${a<n}$ and raise a to the ${(n-1)}$-st power modulo $n$ using the `expmod` procedure. However, whenever we perform the squaring step in expmod, we check to see if we have discovered a “nontrivial square root of 1 modulo n,” that is, a number not equal to 1 or n−1 whose square is equal to 1 modulo n. It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime. It is also possible to prove that if n is an odd number that is not prime, then, for at least half the numbers $a<n$, computing $a^{n-1}$ in this way will reveal a nontrivial square root of 1 modulo n. (This is why the Miller-Rabin test cannot be fooled.) Modify the expmod procedure to signal if it discovers a nontrivial square root of 1, and use this to implement the Miller-Rabin test with a procedure analogous to fermat-test. Check your procedure by testing various known primes and non-primes. Hint: One convenient way to make expmod signal is to have it return 0.

**Solution**

Let's break it down in pieces.

> This starts from an alternate form of Fermat’s Little Theorem, which states that if $n$ is a prime number and $a$ is any positive integer less than $n$, then $a$ raised to the $(n−1)$-st power is congruent to 1 modulo n. To test the primality of a number $n$ by the Miller-Rabin test, we pick a random number ${a<n}$ and raise a to the ${(n-1)}$-st power modulo $n$ using the `expmod` procedure.

If we express this in term of [modular arithmetic](https://en.wikipedia.org/wiki/Modular_arithmetic), we have a congrence relation:

$$a^{n-1}\equiv1\;(mod\;n)$$

Which will be implemented by updating the function `fermat-test` into:

```scheme
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))
```

> However, whenever we perform the squaring step in `expmod`, we check to see if we have discovered a “nontrivial square root of 1 modulo n,” that is, a number not equal to 1 or n−1 whose square is equal to 1 modulo n.

This can be translated into:

```scheme
(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))
```

by returning 0, when checking that `(expmod-checked a (- n 1) n)` is equal to 1 in `miller-rabin-test` will fail and indicate that the number is not prime.

> Modify the expmod procedure to signal if it discovers a nontrivial square root of 1, and use this
> to implement the Miller-Rabin test with a procedure analogous to fermat-test. Check your procedure
> by testing various known primes and non-primes. Hint: One convenient way to make expmod signal is
> to have it return 0.

Putting all that together so that `expmod-checked` works with our new functions:

```scheme
(define (remainder-square-checked x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

(define (expmod-checked base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-square-checked (expmod-checked base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod-checked base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod-checked a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (miller-rabin-prime?  n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (miller-rabin-prime? n (- times 1)))
        (else #f)))

(define (assert-result test-name actual expected)
  (display (if (eq? actual expected) "pass: " "fail: "))
  (display test-name)
  (newline))

(assert-result "   2 is prime"      (miller-rabin-prime?    2 10) #t)
(assert-result "1009 is prime"      (miller-rabin-prime? 1009 10) #t)
(assert-result "   4 is not prime"  (miller-rabin-prime?    4 10) #f)
(assert-result "  99 is not prime"  (miller-rabin-prime?   99 10) #f)
(assert-result " 561 is not prime " (miller-rabin-prime?  561 10) #f) ; (Carmichael number)
```

That will output:

```
pass:    2 is prime
pass: 1009 is prime
pass:    4 is not prime
pass:   99 is not prime
pass:  561 is not prime
```

### Open questions

- Running it without `square-checked` (using normal `square`) didn't change the passing of these specific tests. How can we check that we have a correct implementation?

I worked this one thanks to [solution to 1.28 by billthelizard](http://www.billthelizard.com/2010/03/sicp-exercise-128-miller-rabin-test.html).

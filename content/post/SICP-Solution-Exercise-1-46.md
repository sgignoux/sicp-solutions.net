---
title: "SICP - Solution: Exercise 1.46"
date: 2018-10-29T06:09:58+02:00
draft: false
type: posts
---

**Exercise 1.46:** Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as _iterative improvement_. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. Write a procedure `iterative-improve` that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. `iterative-improve` should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the `sqrt` procedure of 1.1.7 and the `fixed-point` procedure of 1.3.3 in terms of `iterative-improve`.

**Solution**

### Rewriting `sqrt` using `iterative-improve`

This exercice is not just about algorithm, but also how to handle abstraction. If you want to solve ｀ iterative-improve ｀ for only the first question, you arrive at something like this, where `good-enough?` takes only `guess` as parameter:

```scheme
(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess) (iter guess)))
```

Then you can rewrite `sqrt`:

```scheme
(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  ((iterative-improve good-enough? improve) 1.0))

(display (sqrt 11))(newline)
```

### Rewriting `fixed-point` using `iterative-improve`

The function to check if a guess is close enough requires the next value. `f` can be applied to this value for the next guess value and this approach can be used in the definition of `close-enough?`:


```scheme
; --- fixed-point ---
(newline)
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  (define (improve guess)
    (f guess))
  ((iterative-improve close-enough? improve) first-guess))
```

Then you can use `fixed-point` as the previous exercice:

```scheme
(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (sqrt-fixed-point x)
  (fixed-point
   (average-damp
    (lambda (y) (/ x y)))
   1.0))

(display (sqrt-fixed-point 11))(newline)
```

The last step is to rewrite `sqrt` using the directly `iterative-improve`:

```scheme
(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? next guess)
    (< (abs (- (square next) x)) 0.001))
  ((iterative-improve good-enough? improve) 1.0))
```

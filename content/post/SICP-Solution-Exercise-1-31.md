---
title: "SICP - Solution: Exercise 1.31"
date: 2018-10-24T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.31:**

1. The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called `product` that returns the product of the values of a function at points over a given range. Show how to define `factorial` in terms of product. Also use product to compute approximations to π using the formula
   $$\frac\pi4=\frac{2\cdot4\cdot4\cdot6\cdot6\cdot8\cdot\cdots}{3\cdot3\cdot5\cdot5\cdot7\cdot7\cdot\cdots}$$
2. If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

**Solution**

### Implementing recursive `product`

This is straightforward to implement the recursive function `product` from the `sum` code:

```scheme
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))
```

### Implementing `factorial` in terms of `product`

Again, this is quite straightforward:

```scheme
(define (identity x) x)

(define (inc n) (+ n 1))

(define (factorial n)
  (product-iter identity 1 inc n))
```

### Implementing Wallis' product for π in terms of `product`

The formula presented in the text is not very clear, but a quick search on [wikipedia](https://en.wikipedia.org/wiki/Wallis_product) gives a formula like this:

$$\frac{\pi}{2} = \prod\_{n=1}^\infty\left(\frac{2n}{2n-1}\cdot\frac{2n}{2n+1}\right)$$

This formula can be implemented directly using the `product` function:

```scheme
(define (wallis-product n)
  (define (term n) 
    (define 2n (* 2 n))
    (* (/ 2n (- 2n 1))
       (/ 2n (+ 2n 1))))
  (/ (product term 1.0 inc n) 2))
```

### Implementing iterative `product`

This can be done like this:

```scheme
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* a result))))
  (iter a 1))
```

---
title: "SICP - Solution: Exercise 2.8"
date: 2019-01-10T07:09:58+02:00
draft: false
---

**Exercise 2.8:** Using reasoning analogous to Alyssa’s, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called `sub-interval`.

**Solution**

```scheme
(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))
```

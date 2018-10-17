---
title: "SICP - Solution: Exercise 1.2"
date: 2018-09-24T21:03:58+02:00
draft: false
---

**Exercise 1.2:** Translate the following expression into prefix form:

$${\frac{5+4+(2-(3-(6+\frac45)))}{3(6-2)(2-7)}.}$$

**Solution**

```scheme
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
```

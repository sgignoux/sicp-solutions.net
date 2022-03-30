---
title: "SICP - Solution: Exercise 1.26"
date: 2018-10-19T04:03:58+02:00
draft: false
type: posts
---

**Exercise 1.26:** Louis Reasoner is having great difficulty doing Exercise 1.24. His `fast-prime?` test seems to run more slowly than his `prime?` test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewritten the `expmod` procedure to use an explicit multiplication, rather than calling square:

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))
```

“I don’t see what difference that could make,” says Louis. “I do.” says Eva. “By writing the procedure like that, you have transformed the ${\mathrm\Theta(\log n)}$ process into a ${\mathrm\Theta(n)}$ process.” Explain.

**Solution**

Louis Reasoner version of `expmod` doesn't user a `square` function, but use a `*`. This might not seems a lot, but the interpreter uses **applicative-order evaluation**, meaning it will “evaluate the arguments and then apply”.

In case of `(square (expmod base (/ exp 2) m))`, the parameter of `square` will be evaluated once, then `square` will be applied.

In the case of `(* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m))` each of the two parameters of `*` will be fully evaluated before the `*` will be applied. Since both are recursive call, it will double the work to do, whenever this branch is executed. The complexity becomes $\mathrm\Theta(\log 2^n)=\mathrm\Theta(n \log 2)=\mathrm\Theta(n)$.

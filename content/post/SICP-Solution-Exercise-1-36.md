---
title: "SICP - Solution: Exercise 1.36"
date: 2018-10-28T04:03:58+02:00
draft: false
---

**Exercise 1.36:** Modify `fixed-point` so that it prints the sequence of approximations it generates, using the `newline` and `display` primitives shown in Exercise 1.22. Then find a solution to ${x^x=1000}$ by finding a fixed point of $x\mapsto{\log(1000)/\log(x)}$. (Use Scheme’s primitive log procedure, which computes natural logarithms.) Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by ${\log(1)=0}$.)

**Solution**

We can update `fixed-point` in this way to show the sequence of approximation:

```scheme
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
```

Without damping:

```scheme
(display (fixed-point (lambda (x) (/ (log 100) (log x))) 2)) (newline)
2
6.643856189774725
2.4318468141875065
5.18220349492049
2.799103592609581
4.474083040767624
3.0735939466718745
4.101331665508161
3.263042550471523
3.89390861350767
3.3876156118518117
3.774338878643513
3.467160585111255
3.703882334279048
3.5170574911778987
3.6618000473016026
3.548020342802485
3.636455531432125
3.5671080319002773
3.621113728089196
3.5788280227423996
3.611797964445781
3.58600665606369
3.606130550334198
3.590397119344493
3.602678677221703
3.593079898951771
3.6005747438550824
3.594718296719416
3.5992918324007075
3.5957185433616616
3.598509347733154
3.5963290711231792
3.5980320110257193
3.596701676536737
3.597740794209986
3.5969290603825685
3.5975631160407135
3.597067815732927
3.597454706485773
3.5971524853260233
3.597388559396976
3.5972041504698735
3.5973481985922007
3.597235676058036
3.5973235715358247
3.5972549125527054
3.597308544705186
3.597266650359501
3.5972993756703846
3.597273812567488
3.5972937809205825
3.5972781828172766
3.5972903671194523
3.5972808494622672
```

With damping:

```scheme
(display (fixed-point (lambda (x) (average x (/ (log 100) (log x)))) 2)) (newline)
2
4.321928094887363
3.7340886925505887
3.6147319789883383
3.599236305662878
3.597499081067613
3.597308454173251
3.597287587624866
3.5972853041284294
```

It takes 55 steps to converge without the dampig and 9 steps with the damping method. It seems clear that the damping make the convergence much faster in this case.

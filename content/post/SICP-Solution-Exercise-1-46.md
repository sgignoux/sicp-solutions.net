---
title: "SICP - Solution: Exercise 1.46"
date: 2018-10-29T06:09:58+02:00
draft: false
---

**Exercise 1.46:** Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as _iterative improvement_. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. Write a procedure `iterative-improve` that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. `Iterative-improve` should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the `sqrt` procedure of 1.1.7 and the `fixed-point` procedure of 1.3.3 in terms of `iterative-improve`.

**Solution**

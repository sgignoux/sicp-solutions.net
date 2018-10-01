---
title: "SICP - Chapter 1: Building Abstractions With Procedures [Notes]"
date: 2018-09-22T21:03:58+02:00
draft: false
---

This book focus is on large-scale program design, not numerical techniques.

## 1.1 The Elements of Programming

Programming language serves not only to instruct the computer to perform tasks, but also a way to structure our thinking.

Every programming language has three mechanisms to build complex ideas out of simple one:

- **primitive expressions:** which represent the simplest entities the language
- **means of combination:** by which compound elements are built from simpler ones
- **means of abstraction:** by which compound elements can be named and manipulated as units

This mechanisms exists both for data and procedures. Complex programs are constructed by building, step by step, computational objects of increasing complexity.

There are multiple way to evaluate combinations. **Applicative order** and **Normal order** are two ways.

To evaluate a combination using _applicative order_, do the following:

1. Evaluate the subexpressions of the combination.
2. Apply the procedure that is the value of the leftmost subexpression (the operator) to the arguments that are the values of the other subexpressions (the operands).
3. To apply a compound procedure to arguments, evaluate the body of the procedure with each formal parameter replaced by the corresponding argument. [Substitution Model]

The purpose of the substitution is to help us think about procedure application, not to provide a description of how the interpreter really works.

**Applicative order** evaluates subexpressions just before the procedure is applied.

**Normal order** passes subexpressions as they are, without evaluation, and proceeds with the evaluation only when the corresponding formal parameter is actually to be itself evaluated.

Thee contrast between function and procedure is a reﬂection of the general distinction between describing properties of things and describing how to do things, or, as it is sometimes referred to, the distinction between declarative knowledge and imperative knowledge.

## 1.2 Procedures and the Processes They Generate

## 1.3 Formulating Abstractions with Higher-Order Procedures

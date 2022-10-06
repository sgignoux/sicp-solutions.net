---
title: "MIT 6.001 - Structure and Interpretation of Computer Programs: Notes and solutions"
date: 2019-01-14T21:03:14+02:00
draft: false
type: docs
bookToC: false
---

# MIT 6.001 - Structure and Interpretation of Computer Programs: Notes and solutions

This site contains my answer to the exercices from the textbook Structure and Interpretation of Computer Programs, usually just named as "SICP". 

The book has its origins in the popular course "MIT 6.001 introductory course in computer science" taught by Harold Abelson and Gerald Jay Sussman at the Massachusetts Institute of Technology.

The second edition (1996) of the book is now licensed under a Creative Commons License by the MIT Press and you can download it freely. The video of the original course have also kindly made public by MIT.

It might not be an easy book to follow all the way, but it introduce many fundamental topics in a very well organized way. Reading the book is a journey into many facets of computer science.

<!-- todo: explain people how they can start -->

> SICP was revolutionary in many different ways. Most importantly, it dramatically raised the bar for the intellectual content of introductory computer science. Before SICP, the first CS course was almost always entirely filled with learning the details of some programming language. SICP is about standing back from the details to learn big-picture ways to think about the programming process. It focused attention on the central idea of abstraction -- finding general patterns from specific problems and building software tools that embody each pattern. It made heavy use of the idea of functions as data, an idea that's hard to learn initially, but immensely powerful once learned.
>
> -- [Why Structure and Interpretation of Computer Programs matters](http://people.eecs.berkeley.edu/~bh/sicp.html)


My first encouter with the book Structure and Interpretation of Computer Programs was nearly 20 years ago and I still remember it. Going through this book was intense, deep and enlightening. It had a deep impact on how I would think about programming.

20 years later, I wanted to go back into some serious programming but also practice writing clear explanations. So I decided to read back the book and actually work on all the exercices.

The plan is for each chapter:

- Watch the video from the 1986 session
- Read the book
- Complete all the 356 exercises by myself, using [DrRacket](https://racket-lang.org/), and publish my solution here. Each solution should include clear explanations.
- Review my solution and compare them to the [community schemewiki SICP-Solutions](http://community.schemewiki.org/?SICP-Solutions) or other solutions

These solutions are for reference only. The value of this book is in solving each exercise by oneself. Please consider only checking solution after being stuck or after having solved the problem comparing your solution.

## Table of Content

<!-- todo: Add link to video directly -->
<!-- todo: Add symbol for detailed solution -->
<!-- todo: Add for each chapter, what it is about, key takeaway -->

### Chapter 1: Building Abstractions with Procedures

#### 1.1 The Elements of Programming

📺 [Lecture 1A: Overview and Introduction to Lisp - YouTube](https://www.youtube.com/watch?v=-J_xL4IGhJA&list=PLE18841CABEA24090&index=1&t=36s) 

##### 1.1.1 Expressions

##### 1.1.2 Naming and the Environment

##### 1.1.3 Evaluating Combinations

##### 1.1.4 Compound Procedures

##### 1.1.5 The Substitution Model for Procedure Application

##### 1.1.6 Conditional Expressions and Predicates

- [Exercise 1.1]({{< ref "/post/sicp-solution-exercise-1-1.md" >}}) ✓
- [Exercise 1.2]({{< ref "/post/sicp-solution-exercise-1-2.md" >}}) ✓
- [Exercise 1.3]({{< ref "/post/sicp-solution-exercise-1-3.md" >}}) ✓
- [Exercise 1.4]({{< ref "/post/sicp-solution-exercise-1-4.md" >}}) ✓
- [Exercise 1.5]({{< ref "/post/sicp-solution-exercise-1-5.md" >}}) ✓

##### 1.1.7 Example: Square Roots by Newton's Method

- [Exercise 1.6]({{< ref "/post/sicp-solution-exercise-1-6.md" >}}) ✓
- [Exercise 1.7]({{< ref "/post/sicp-solution-exercise-1-7.md" >}}) ✓
- [Exercise 1.8]({{< ref "/post/sicp-solution-exercise-1-8.md" >}}) ✓

##### 1.1.8 Procedures as Black-Box Abstractions

#### 1.2 Procedures and the Processes They Generate

📺 [Lecture 1B: Procedures and Processes; Substitution Model - YouTube](https://www.youtube.com/watch?v=V_7mmwpgJHU&list=PLE18841CABEA24090&index=2) 

##### 1.2.1 Linear Recursion and Iteration

- [Exercise 1.9]({{< ref "/post/sicp-solution-exercise-1-9.md" >}}) ✓
- [Exercise 1.10]({{< ref "/post/sicp-solution-exercise-1-10.md" >}}) ✓

##### 1.2.2 Tree Recursion

- [Exercise 1.11]({{< ref "/post/sicp-solution-exercise-1-11.md" >}}) ✓
- [Exercise 1.12]({{< ref "/post/sicp-solution-exercise-1-12.md" >}}) ✓
- [Exercise 1.13]({{< ref "/post/sicp-solution-exercise-1-13.md" >}}) ✓

##### 1.2.3 Orders of Growth

- [Exercise 1.14]({{< ref "/post/sicp-solution-exercise-1-14.md" >}}) ✓
- [Exercise 1.15]({{< ref "/post/sicp-solution-exercise-1-15.md" >}}) ✓

##### 1.2.4 Exponentiation

- [Exercise 1.16]({{< ref "/post/sicp-solution-exercise-1-16.md" >}}) ✓
- [Exercise 1.17]({{< ref "/post/sicp-solution-exercise-1-17.md" >}}) ✓
- [Exercise 1.18]({{< ref "/post/sicp-solution-exercise-1-18.md" >}}) ✓
- [Exercise 1.19]({{< ref "/post/sicp-solution-exercise-1-19.md" >}}) ✓

##### 1.2.5 Greatest Common Divisors

- [Exercise 1.20]({{< ref "/post/sicp-solution-exercise-1-20.md" >}}) ✓

##### 1.2.6 Example: Testing for Primality

- [Exercise 1.21]({{< ref "/post/sicp-solution-exercise-1-21.md" >}}) ✓
- [Exercise 1.22]({{< ref "/post/sicp-solution-exercise-1-22.md" >}}) ✓
- [Exercise 1.23]({{< ref "/post/sicp-solution-exercise-1-23.md" >}}) ✓
- [Exercise 1.24]({{< ref "/post/sicp-solution-exercise-1-24.md" >}}) ✓
- [Exercise 1.25]({{< ref "/post/sicp-solution-exercise-1-25.md" >}}) ✓
- [Exercise 1.26]({{< ref "/post/sicp-solution-exercise-1-26.md" >}}) ✓
- [Exercise 1.27]({{< ref "/post/sicp-solution-exercise-1-27.md" >}}) ✓
- [Exercise 1.28]({{< ref "/post/sicp-solution-exercise-1-28.md" >}}) ✓

#### 1.3 Formulating Abstractions with Higher-Order Procedures

📺 [Lecture 2A: Higher-order Procedures - YouTube](https://www.youtube.com/watch?v=eJeMOEiHv8c&list=PLE18841CABEA24090&index=3) 

##### 1.3.1 Procedures as Arguments

- [Exercise 1.29]({{< ref "/post/sicp-solution-exercise-1-29.md" >}}) ✓
- [Exercise 1.30]({{< ref "/post/sicp-solution-exercise-1-30.md" >}}) ✓
- [Exercise 1.31]({{< ref "/post/sicp-solution-exercise-1-31.md" >}}) ✓
- [Exercise 1.32]({{< ref "/post/sicp-solution-exercise-1-32.md" >}}) ✓
- [Exercise 1.33]({{< ref "/post/sicp-solution-exercise-1-33.md" >}}) ✓

##### 1.3.2 Constructing Procedures Using Lambda

- [Exercise 1.34]({{< ref "/post/sicp-solution-exercise-1-34.md" >}}) ✓

##### 1.3.3 Procedures as General Methods

- [Exercise 1.35]({{< ref "/post/sicp-solution-exercise-1-35.md" >}}) ✓
- [Exercise 1.36]({{< ref "/post/sicp-solution-exercise-1-36.md" >}}) ✓
- [Exercise 1.37]({{< ref "/post/sicp-solution-exercise-1-37.md" >}}) ✓
- [Exercise 1.38]({{< ref "/post/sicp-solution-exercise-1-38.md" >}}) ✓
- [Exercise 1.39]({{< ref "/post/sicp-solution-exercise-1-39.md" >}}) ✓

##### 1.3.4 Procedures as Returned Values

- [Exercise 1.40]({{< ref "/post/sicp-solution-exercise-1-40.md" >}}) ✓
- [Exercise 1.41]({{< ref "/post/sicp-solution-exercise-1-41.md" >}}) ✓
- [Exercise 1.42]({{< ref "/post/sicp-solution-exercise-1-42.md" >}}) ✓
- [Exercise 1.43]({{< ref "/post/sicp-solution-exercise-1-43.md" >}}) ✓
- [Exercise 1.44]({{< ref "/post/sicp-solution-exercise-1-44.md" >}}) ✓
- [Exercise 1.45]({{< ref "/post/sicp-solution-exercise-1-45.md" >}}) ✓
- [Exercise 1.46]({{< ref "/post/sicp-solution-exercise-1-46.md" >}}) ✓

### Chapter 2: Building Abstractions with Data

#### 2.1 Introduction to Data Abstraction

📺 [Lecture 2B: Compound Data - YouTube](https://www.youtube.com/watch?v=DrFkf-T-6Co&list=PLE18841CABEA24090&index=4) 

##### 2.1.1 Example: Arithmetic Operations for Rational Numbers

- [Exercise 2.1]({{< ref "/post/sicp-solution-exercise-2-1.md" >}}) ✓

##### 2.1.2 Abstraction Barriers

- [Exercise 2.2]({{< ref "/post/sicp-solution-exercise-2-2.md" >}}) ✓
- [Exercise 2.3]({{< ref "/post/sicp-solution-exercise-2-3.md" >}}) ✓

##### 2.1.3 What Is Meant by Data?

- [Exercise 2.4]({{< ref "/post/sicp-solution-exercise-2-4.md" >}}) ✓
- [Exercise 2.5]({{< ref "/post/sicp-solution-exercise-2-5.md" >}}) ✓
- [Exercise 2.6]({{< ref "/post/sicp-solution-exercise-2-6.md" >}}) ✓

##### 2.1.4 Extended Exercise: Interval Arithmetic

- [Exercise 2.7]({{< ref "/post/sicp-solution-exercise-2-7.md" >}}) ✓
- [Exercise 2.8]({{< ref "/post/sicp-solution-exercise-2-8.md" >}}) ✓
- [Exercise 2.9]({{< ref "/post/sicp-solution-exercise-2-9.md" >}}) ✓
- [Exercise 2.10]({{< ref "/post/sicp-solution-exercise-2-10.md" >}}) ✓
- Exercise 2.11
- Exercise 2.12
- Exercise 2.13
- Exercise 2.14
- Exercise 2.15
- Exercise 2.16

#### 2.2 Hierarchical Data and the Closure Property

📺 [Lecture 3A: Henderson Escher Example - YouTube](https://www.youtube.com/watch?v=PEwZL3H2oKg&list=PLE18841CABEA24090&index=5) 

##### 2.2.1 Representing Sequences

- Exercise 2.17
- Exercise 2.18
- Exercise 2.19
- Exercise 2.20
- Exercise 2.21
- Exercise 2.22
- Exercise 2.23

##### 2.2.2 Hierarchical Structures

- Exercise 2.24
- Exercise 2.25
- Exercise 2.26
- Exercise 2.27
- Exercise 2.28
- Exercise 2.29
- Exercise 2.30
- Exercise 2.31
- Exercise 2.32

##### 2.2.3 Sequences as Conventional Interfaces

- Exercise 2.33
- Exercise 2.34
- Exercise 2.35
- Exercise 2.36
- Exercise 2.37
- Exercise 2.38
- Exercise 2.39
- Exercise 2.40
- Exercise 2.41
- Exercise 2.42
- Exercise 2.43

##### 2.2.4 Example: A Picture Language

- Exercise 2.44
- Exercise 2.45
- Exercise 2.46
- Exercise 2.47
- Exercise 2.48
- Exercise 2.49
- Exercise 2.50
- Exercise 2.51
- Exercise 2.52

#### 2.3 Symbolic Data

📺 [Lecture 3B: Symbolic Differentiation; Quotation - YouTube](https://www.youtube.com/watch?v=bV87UzKMRtE&list=PLE18841CABEA24090&index=6) 

📺 [Lecture 4A: Pattern Matching and Rule-based Substitution - YouTube](https://www.youtube.com/watch?v=_fXQ1SwKjDg&list=PLE18841CABEA24090&index=7) 

##### 2.3.1 Quotation

- Exercise 2.53
- Exercise 2.54
- Exercise 2.55

##### 2.3.2 Example: Symbolic Differentiation

- Exercise 2.56
- Exercise 2.57
- Exercise 2.58

##### 2.3.3 Example: Representing Sets

- Exercise 2.59
- Exercise 2.60
- Exercise 2.61
- Exercise 2.62
- Exercise 2.63
- Exercise 2.64
- Exercise 2.65
- Exercise 2.66

##### 2.3.4 Example: Huffman Encoding Trees

- Exercise 2.67
- Exercise 2.68
- Exercise 2.69
- Exercise 2.70
- Exercise 2.71
- Exercise 2.72

#### 2.4 Multiple Representations for Abstract Data

📺 [Lecture 4B: Generic Operators - YouTube](https://www.youtube.com/watch?v=OscT4N2qq7o&list=PLE18841CABEA24090&index=8) 

##### 2.4.1 Representations for Complex Numbers

##### 2.4.2 Tagged data

##### 2.4.3 Data-Directed Programming and Additivity

- Exercise 2.73
- Exercise 2.74
- Exercise 2.75
- Exercise 2.76
- Exercise 2.77

#### 2.5 Systems with Generic Operations

##### 2.5.1 Generic Arithmetic Operations

- Exercise 2.78
- Exercise 2.79
- Exercise 2.80

##### 2.5.2 Combining Data of Different Types

- Exercise 2.81
- Exercise 2.82
- Exercise 2.83
- Exercise 2.84
- Exercise 2.85
- Exercise 2.86

##### 2.5.3 Example: Symbolic Algebra

- Exercise 2.87
- Exercise 2.88
- Exercise 2.89
- Exercise 2.90
- Exercise 2.91
- Exercise 2.92
- Exercise 2.93
- Exercise 2.94
- Exercise 2.95
- Exercise 2.96
- Exercise 2.97

### Chapter 3: Modularity, Objects, and State

📺 [Lecture 5A: Assignment, State, and Side-effects - YouTube](https://www.youtube.com/watch?v=dO1aqPBJCPg&list=PLE18841CABEA24090&index=9) 

#### 3.1 Assignment and Local State

##### 3.1.1 Local State Variables

- Exercise 3.1
- Exercise 3.2
- Exercise 3.3
- Exercise 3.4

##### 3.1.2 The Benefits of Introducing Assignment

- Exercise 3.5
- Exercise 3.6

##### 3.1.3 The Costs of Introducing Assignment

- Exercise 3.7
- Exercise 3.8

#### 3.2 The Environment Model of Evaluation

##### 3.2.1 The Rules for Evaluation

##### 3.2.2 Applying Simple Procedures

##### 3.2.3 Frames as the Repository of Local State

- Exercise 3.9
- Exercise 3.10

##### 3.2.4 Internal Definitions

- Exercise 3.11

#### 3.3 Modeling with Mutable Data

📺 [Lecture 5B: Computational Objects - YouTube](https://www.youtube.com/watch?v=yedzRWhi-9E&list=PLE18841CABEA24090&index=10) 

##### 3.3.1 Mutable List Structure

- Exercise 3.12
- Exercise 3.13
- Exercise 3.14
- Exercise 3.15
- Exercise 3.16
- Exercise 3.17
- Exercise 3.18
- Exercise 3.19
- Exercise 3.20

##### 3.3.2 Representing Queues

- Exercise 3.21
- Exercise 3.22
- Exercise 3.23

##### 3.3.3 Representing Tables

- Exercise 3.24
- Exercise 3.25
- Exercise 3.26
- Exercise 3.27

##### 3.3.4 A Simulator for Digital Circuits

- Exercise 3.28
- Exercise 3.29
- Exercise 3.30
- Exercise 3.31
- Exercise 3.32

##### 3.3.5 Propagation of Constraints

- Exercise 3.33
- Exercise 3.34
- Exercise 3.35
- Exercise 3.36
- Exercise 3.37

#### 3.4 Concurrency: Time Is of the Essence

##### 3.4.1 The Nature of Time in Concurrent Systems

- Exercise 3.38

##### 3.4.2 Mechanisms for Controlling Concurrency

- Exercise 3.39
- Exercise 3.40
- Exercise 3.41
- Exercise 3.42
- Exercise 3.43
- Exercise 3.44
- Exercise 3.45
- Exercise 3.46
- Exercise 3.47
- Exercise 3.48
- Exercise 3.49

#### 3.5 Streams

📺 [Lecture 6A: Streams, Part 1 - YouTube](https://www.youtube.com/watch?v=JkGKLILLy0I&list=PLE18841CABEA24090&index=11) 

📺 [Lecture 6B: Streams, Part 2 - YouTube](https://www.youtube.com/watch?v=qp05AtXbOP0&list=PLE18841CABEA24090&index=12) 

##### 3.5.1 Streams Are Delayed Lists

- Exercise 3.50
- Exercise 3.51
- Exercise 3.52

##### 3.5.2 Infinite Streams

- Exercise 3.53
- Exercise 3.54
- Exercise 3.55
- Exercise 3.56
- Exercise 3.57
- Exercise 3.58
- Exercise 3.59
- Exercise 3.60
- Exercise 3.61
- Exercise 3.62

##### 3.5.3 Exploiting the Stream Paradigm

- Exercise 3.63
- Exercise 3.64
- Exercise 3.65
- Exercise 3.66
- Exercise 3.67
- Exercise 3.68
- Exercise 3.69
- Exercise 3.70
- Exercise 3.71
- Exercise 3.72
- Exercise 3.73
- Exercise 3.74
- Exercise 3.75
- Exercise 3.76

##### 3.5.4 Streams and Delayed Evaluation

- Exercise 3.77
- Exercise 3.78
- Exercise 3.79
- Exercise 3.80
- Exercise 3.81
- Exercise 3.82

### Chapter 4: Metalinguistic Abstraction

#### 4.1 The Metacircular Evaluator

📺 [Lecture 7A: Metacircular Evaluator, Part 1 - YouTube](https://www.youtube.com/watch?v=aAlR3cezPJg&list=PLE18841CABEA24090&index=13) 

##### 4.1.1 The Core of the Evaluator

- Exercise 4.1

##### 4.1.2 Representing Expressions

- Exercise 4.2
- Exercise 4.3
- Exercise 4.4
- Exercise 4.5
- Exercise 4.6
- Exercise 4.7
- Exercise 4.8
- Exercise 4.9
- Exercise 4.10

##### 4.1.3 Evaluator Data Structures

- Exercise 4.11
- Exercise 4.12
- Exercise 4.13

##### 4.1.4 Running the Evaluator as a Program

- Exercise 4.14

##### 4.1.5 Data as Programs

- Exercise 4.15

##### 4.1.6 Internal Definitions

- Exercise 4.16
- Exercise 4.17
- Exercise 4.18
- Exercise 4.19
- Exercise 4.20
- Exercise 4.21

##### 4.1.7 Separating Syntactic Analysis from Execution

- Exercise 4.22
- Exercise 4.23
- Exercise 4.24

#### 4.2 Variations on a Scheme-Lazy Evaluation

📺 [Lecture 7B: Metacircular Evaluator, Part 2 - YouTube](https://www.youtube.com/watch?v=QVEOq5k6Xi0&list=PLE18841CABEA24090&index=14) 

##### 4.2.1 Normal Order and Applicative Order

- Exercise 4.25
- Exercise 4.26

##### 4.2.2 An Interpreter with Lazy Evaluation

- Exercise 4.27
- Exercise 4.28
- Exercise 4.29
- Exercise 4.30
- Exercise 4.31

##### 4.2.3 Streams as Lazy Lists

- Exercise 4.32
- Exercise 4.33
- Exercise 4.34

#### 4.3 Variations on a Scheme-Nondeterministic Computing

##### 4.3.1 Amb and Search

- Exercise 4.35
- Exercise 4.36
- Exercise 4.37

##### 4.3.2 Examples of Nondeterministic Programs

- Exercise 4.38
- Exercise 4.39
- Exercise 4.40
- Exercise 4.41
- Exercise 4.42
- Exercise 4.43
- Exercise 4.44
- Exercise 4.45
- Exercise 4.46
- Exercise 4.47
- Exercise 4.48
- Exercise 4.49

##### 4.3.3 Implementing the Amb Evaluator

- Exercise 4.50
- Exercise 4.51
- Exercise 4.52
- Exercise 4.53
- Exercise 4.54

#### 4.4 Logic Programming

📺 [Lecture 8A: Logic Programming, Part 1 - YouTube](https://www.youtube.com/watch?v=rCqMiPk1BJE&list=PLE18841CABEA24090&index=15) 

📺 [Lecture 8B: Logic Programming, Part 2 - YouTube](https://www.youtube.com/watch?v=GReBwkGFZcs&list=PLE18841CABEA24090&index=16) 

##### 4.4.1 Deductive Information Retrieval

- Exercise 4.55
- Exercise 4.56
- Exercise 4.57
- Exercise 4.58
- Exercise 4.59
- Exercise 4.60
- Exercise 4.61
- Exercise 4.62
- Exercise 4.63

##### 4.4.2 How the Query System Works

##### 4.4.3 Is Logic Programming Mathematical Logic?

- Exercise 4.64
- Exercise 4.65
- Exercise 4.66
- Exercise 4.67
- Exercise 4.68
- Exercise 4.69

##### 4.4.4 Implementing the Query System

- Exercise 4.70
- Exercise 4.71
- Exercise 4.72
- Exercise 4.73
- Exercise 4.74
- Exercise 4.75
- Exercise 4.76
- Exercise 4.77
- Exercise 4.78
- Exercise 4.79

### Chapter 5: Computing with Register Machines

#### 5.1 Designing Register Machines

📺 [Lecture 9A: Register Machines - YouTube](https://www.youtube.com/watch?v=cIc8ZBMcqAc&list=PLE18841CABEA24090&index=17) 

- Exercise 5.1

##### 5.1.1 A Language for Describing Register Machines

- Exercise 5.2

##### 5.1.2 Abstraction in Machine Design

- Exercise 5.3

##### 5.1.3 Subroutines

##### 5.1.4 Using a Stack to Implement Recursion

- Exercise 5.4
- Exercise 5.5
- Exercise 5.6

##### 5.1.5 Instruction Summary


#### 5.2 A Register-Machine Simulator

📺 [Lecture 9B: Explicit-control Evaluator - YouTube](https://www.youtube.com/watch?v=Z8-qWEEwTCk&list=PLE18841CABEA24090&index=18) 

- Exercise 5.7

##### 5.2.1 The Machine Model

##### 5.2.2 The Assembler

- Exercise 5.8

##### 5.2.3 Generating Execution Procedures for Instructions

- Exercise 5.9
- Exercise 5.10
- Exercise 5.11
- Exercise 5.12
- Exercise 5.13

##### 5.2.4 Monitoring Machine Performance

- Exercise 5.14
- Exercise 5.15
- Exercise 5.16
- Exercise 5.17
- Exercise 5.18
- Exercise 5.19

#### 5.3 Storage Allocation and Garbage Collection

📺 [Lecture 10B: Storage Allocation and Garbage Collection - YouTube](https://www.youtube.com/watch?v=AbK4bZhUk48&list=PLE18841CABEA24090&index=20) 

##### 5.3.1 Memory as Vectors

- Exercise 5.20
- Exercise 5.21
- Exercise 5.22

##### 5.3.2 Maintaining the Illusion of Infinite Memory

#### 5.4 The Explicit-Control Evaluator

##### 5.4.1 The Core of the Explicit-Control Evaluator

##### 5.4.2 Sequence Evaluation and Tail Recursion

##### 5.4.3 Conditionals, Assignments, and Definitions

- Exercise 5.23
- Exercise 5.24
- Exercise 5.25

##### 5.4.4 Running the Evaluator

- Exercise 5.26
- Exercise 5.27
- Exercise 5.28
- Exercise 5.29
- Exercise 5.30

#### 5.5 Compilation

📺 [Lecture 10A: Compilation - YouTube](https://www.youtube.com/watch?v=TqO6V3qR9Ws&list=PLE18841CABEA24090&index=19) 

##### 5.5.1 Structure of the Compiler

- Exercise 5.31
- Exercise 5.32

##### 5.5.2 Compiling Expressions

##### 5.5.3 Compiling Combinations

##### 5.5.4 Combining Instruction Sequences

##### 5.5.5 An Example of Compiled Code

- Exercise 5.33
- Exercise 5.34
- Exercise 5.35
- Exercise 5.36
- Exercise 5.37
- Exercise 5.38

##### 5.5.6 Lexical Addressing

- Exercise 5.39
- Exercise 5.40
- Exercise 5.41
- Exercise 5.42
- Exercise 5.43
- Exercise 5.44

##### 5.5.7 Interfacing Compiled Code to the Evaluator

- Exercise 5.45
- Exercise 5.46
- Exercise 5.47
- Exercise 5.48
- Exercise 5.49
- Exercise 5.50
- Exercise 5.51
- Exercise 5.52

## Resources

### Book

- [Original website from MIT with HTML version of the book](https://mitpress.mit.edu/sites/default/files/sicp/index.html)
- [New version in PDF and HTML with updated layout](https://sicpebook.wordpress.com/)

### Videos

- [Playlist for MIT 6.001 Structure and Interpretation, 1986 on Youtube](https://www.youtube.com/playlist?list=PLE18841CABEA24090)
- [Video lectures for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/)

### Other

- [Projects for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/projects/)
- [Lecture Notes for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/lecture-notes/)
- [If not SICP, then what? Maybe HTDP? (stevenrosenberg.net) -- Thread on Hacker News](https://news.ycombinator.com/item?id=18890417)


### Other solutions

- [Structure and Interpretation of Computer Programs](https://github.com/zv/SICP-guile): "This repository includes answers to a bit more than 90% of the book’s 360-some exercises as well as material intended to help others get an idea of how to begin with the book, avoid many common pitfalls as they continue, and review interesting secondary material along the way."

### Tools used

- [DrRacket](https://racket-lang.org/): used to develop and run the code.
- [MathType demo - For Developers](http://www.wiris.com/editor/demo/en/developers#mathml-latex): used to write and check the Latex.

### Misc links

* [Episode 503: Robert Martin on Structure and Interpretation of Computer Programming](https://www.youtube.com/watch?v=Z0VpFmp_q4A)
  * "It changed the way I look at the fundamental structure of programs. It is possible, and desirable, to write code without assignement statements as much as possible. To not mutate the states of variables. And it forces you to think about software in a very different way. [...] I assign now variable less frequently."
  * "[functional programming] forces you to keep your data in much better order. There will always be times when you have to change the state of the system but you do so with a tremendous amount of discipline in this language. You treat the changing of data in the system the way you would treat a transaction on disk."

## What next?

* [nand2tetris](https://www.nand2tetris.org/) 

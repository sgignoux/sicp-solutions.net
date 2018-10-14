---
title: "MIT 6.001 - Structure and Interpretation of Computer Programs: Notes and solutions"
date: 2018-09-20T21:03:14+02:00
draft: false
---

> SICP was revolutionary in many different ways. Most importantly, it dramatically raised the bar for the intellectual content of introductory computer science. Before SICP, the first CS course was almost always entirely filled with learning the details of some programming language. SICP is about standing back from the details to learn big-picture ways to think about the programming process. It focused attention on the central idea of abstraction -- finding general patterns from specific problems and building software tools that embody each pattern. It made heavy use of the idea of functions as data, an idea that's hard to learn initially, but immensely powerful once learned.
>
> -- [Why Structure and Interpretation of Computer Programs matters](http://people.eecs.berkeley.edu/~bh/sicp.html)

I have read the Structure and Interpretation of Computer Programs nearly 20 years ago and I still remember it. Going through this book was intense and enlightening. It had a deep impact on how I would think about programming.

After 20 years, my work has moved me farther and farther from software engineering: managing teams, managing products, doing consulting works, etc. In the last few years, I had the opportunity to see complex software being built, and I was disappointed at the lack of quality and the level of bugs in the code base.

Many seems to think that building high quality software takes more time and can't be afforded. I can't accept that. My belief is that high quality software can be built not only faster, but cheaper than crappy software in the long run.

But at some point, you have to stop arguing for it and put your money where your mouth is. Well, this is my starting point. I plan to read the Structure and Interpretation of Computer Programs again, this time doing all the exercise. This is a just warmup before attacking more ambitious things.

I expect that by doing that I will:

- become a better software engineer
- aquire a deeper understanding of functional programming
- have fun programming and building things
- learn how to write clear explanation

This is the current plan:

- Read the book
- Watch the video from the 1986 session
- Complete all the 356 exercises by myself, and publish my solution here. Each solution should include clear explanations.
- Review my solution and compare them to the [community schemewiki SICP-Solutions](http://community.schemewiki.org/?SICP-Solutions) or other solutions

This solution are here for reference only. The value of this book is in actually trying to solving each exercise. Please consider only checking solution after being stuck or after having solved the problem to compare your solution.

## Resources

**Book**

- [Book in pdf and html](https://sicpebook.wordpress.com/)
- [Original html from MIT press ](http://mitpress.mit.edu/sites/default/files/sicp/index.html)

**Videos**

- [Playlist for MIT 6.001 Structure and Interpretation, 1986 on Youtube](https://www.youtube.com/playlist?list=PLE18841CABEA24090)
- [Video lectures for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/video-lectures/)

**Other**

- [Projects for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/projects/)
- [Lecture Notes for MIT 6.001 on ocw.mit.edu](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-001-structure-and-interpretation-of-computer-programs-spring-2005/lecture-notes/)

## Table of Content

### Chapter 1: Building Abstractions with Procedures

#### 1.1 The Elements of Programming

- [1.1]({{< ref "/post/SICP-Solution-Exercise-1-1.md" >}}) ✓
- [1.2]({{< ref "/post/SICP-Solution-Exercise-1-2.md" >}}) ✓
- [1.3]({{< ref "/post/SICP-Solution-Exercise-1-3.md" >}}) ✓
- [1.4]({{< ref "/post/SICP-Solution-Exercise-1-4.md" >}}) ✓
- [1.5]({{< ref "/post/SICP-Solution-Exercise-1-5.md" >}}) ✓
- [1.6]({{< ref "/post/SICP-Solution-Exercise-1-6.md" >}}) ✓
- [1.7]({{< ref "/post/SICP-Solution-Exercise-1-7.md" >}}) ✓
- [1.8]({{< ref "/post/SICP-Solution-Exercise-1-8.md" >}}) ✓

#### 1.2 Procedures and the Processes They Generate

- [1.9]({{< ref "/post/SICP-Solution-Exercise-1-9.md" >}}) ✓
- [1.10]({{< ref "/post/SICP-Solution-Exercise-1-10.md" >}}) ✓
- [1.11]({{< ref "/post/SICP-Solution-Exercise-1-11.md" >}}) ✓
- [1.12]({{< ref "/post/SICP-Solution-Exercise-1-12.md" >}}) ✓
- [1.13]({{< ref "/post/SICP-Solution-Exercise-1-13.md" >}}) ✓
- [1.14]({{< ref "/post/SICP-Solution-Exercise-1-14.md" >}}) ✓
- [1.15]({{< ref "/post/SICP-Solution-Exercise-1-15.md" >}}) ✓
- [1.16]({{< ref "/post/SICP-Solution-Exercise-1-16.md" >}}) ✓
- [1.17]({{< ref "/post/SICP-Solution-Exercise-1-17.md" >}}) ✓
- [1.18]({{< ref "/post/SICP-Solution-Exercise-1-18.md" >}}) ✓
- [1.19]({{< ref "/post/SICP-Solution-Exercise-1-19.md" >}}) ✓
- [1.20]({{< ref "/post/SICP-Solution-Exercise-1-20.md" >}})
- 1.21
- 1.22
- 1.23
- 1.24
- 1.25
- 1.26
- 1.27
- 1.28

#### 1.3 Formulating Abstractions with Higher-Order Procedures

- 1.29
- 1.30
- 1.31
- 1.32
- 1.33
- 1.34
- 1.35
- 1.36
- 1.37
- 1.38
- 1.39
- 1.40
- 1.41
- 1.42
- 1.43
- 1.44
- 1.45
- 1.46

### Chapter 2: Building Abstractions with Data

2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 2.10, 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.20, 2.21, 2.22, 2.23, 2.24, 2.25, 2.26, 2.27, 2.28, 2.29, 2.30, 2.31, 2.32, 2.33, 2.34, 2.35, 2.36, 2.37, 2.38, 2.39, 2.40, 2.41, 2.42, 2.43, 2.44, 2.45, 2.46, 2.47, 2.48, 2.49, 2.50, 2.51, 2.52, 2.53, 2.54, 2.55, 2.56, 2.57, 2.58, 2.59, 2.60, 2.61, 2.62, 2.63, 2.64, 2.65, 2.66, 2.67, 2.68, 2.69, 2.70, 2.71, 2.72, 2.73, 2.74, 2.75, 2.76, 2.77, 2.78, 2.79, 2.80, 2.81, 2.82, 2.83, 2.84, 2.85, 2.86, 2.87, 2.88, 2.89, 2.90, 2.91, 2.92, 2.93, 2.94, 2.95, 2.96, 2.97

### Chapter 3: Modularity, Objects, and State

3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7, 3.8, 3.9, 3.10, 3.11, 3.12, 3.13, 3.14, 3.15, 3.16, 3.17, 3.18, 3.19, 3.20, 3.21, 3.22, 3.23, 3.24, 3.25, 3.26, 3.27, 3.28, 3.29, 3.30, 3.31, 3.32, 3.33, 3.34, 3.35, 3.36, 3.37, 3.38, 3.39, 3.40, 3.41, 3.42, 3.43, 3.44, 3.45, 3.46, 3.47, 3.48, 3.49, 3.50, 3.51, 3.52, 3.53, 3.54, 3.55, 3.56, 3.57, 3.58, 3.59, 3.60, 3.61, 3.62, 3.63, 3.64, 3.65, 3.66, 3.67, 3.68, 3.69, 3.70, 3.71, 3.72, 3.73, 3.74, 3.75, 3.76, 3.77, 3.78, 3.79, 3.80, 3.81, 3.82

### Chapter 4: Metalinguistic Abstraction

4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 4.10, 4.11, 4.12, 4.13, 4.14, 4.15, 4.16, 4.17, 4.18, 4.19, 4.20, 4.21, 4.22, 4.23, 4.24, 4.25, 4.26, 4.27, 4.28, 4.29, 4.30, 4.31, 4.32, 4.33, 4.34, 4.35, 4.36, 4.37, 4.38, 4.39, 4.40, 4.41, 4.42, 4.43, 4.44, 4.45, 4.46, 4.47, 4.48, 4.49, 4.50, 4.51, 4.52, 4.53, 4.54, 4.55, 4.56, 4.57, 4.58, 4.59, 4.60, 4.61, 4.62, 4.63, 4.64, 4.65, 4.66, 4.67, 4.68, 4.69, 4.70, 4.71, 4.72, 4.73, 4.74, 4.75, 4.76, 4.77, 4.78, 4.79

### Chapter 5: Computing with Register Machines

5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 5.10, 5.11, 5.12, 5.13, 5.14, 5.15, 5.16, 5.17, 5.18, 5.19, 5.20, 5.21, 5.22, 5.23, 5.24, 5.25, 5.26, 5.27, 5.28, 5.29, 5.30, 5.31, 5.32, 5.33, 5.34, 5.35, 5.36, 5.37, 5.38, 5.39, 5.40, 5.41, 5.42, 5.43, 5.44, 5.45, 5.46, 5.47, 5.48, 5.49, 5.50, 5.51, 5.52

## Other solutions

Todo

- https://github.com/zv/SICP-guile

## Scheme implementations

- DrRacket
- https://www.gnu.org/software/mit-scheme/

* https://github.com/zv/SICP-guile

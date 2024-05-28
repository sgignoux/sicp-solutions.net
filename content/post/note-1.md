---
title: "SICP - Notes on Chapter 1"
draft: false
type: posts
---

Note: this cover the first two video.

In which we learn that computer science is not really about computer and not really a science either, the tools to manage complexity and some of the LISP language.

<!-- todo: separate quotes from book 📖 and video 📺 with emoji? -->

<!-- todo: find the keywords and the key ideas -->

## What is computer science

It is about the difference of the _program_ as a tool and the fundamental notion of _computational process_ that underly it.

- Declarative knowledge ("what is true") vs imperative knowledge ("how to")
- Process and procedure and the language used to express them

> 📺 when some field is just getting started and you don't really understand it very well, it's very easy to confuse the essence of what you're doing with the tools that you use. And indeed, on some absolute scale of things, we probably know less about the essence of computer science than the ancient Egyptians really knew about geometry.

> 📺 Well, what do I mean by the essence of computer science? What do I mean by the essence of geometry? See, it's certainly true that these Egyptians went off and used surveying instruments, but when we look back on them after a couple of thousand years, we say, gee, what they were doing, the important stuff they were doing, was to begin to **formalize** notions about space and time, to start a way of talking about mathematical truths formally. That led to the **axiomatic method**. That led to sort of all of modern mathematics, figuring out a way to talk precisely about so-called **declarative knowledge**, what is true.
> 
> Well, similarly, I think in the future people will look back and say, yes, those primitives in the 20th century were fiddling around with these gadgets called computers, but really what they were doing is starting to learn how to formalize intuitions about process, how to do things, starting to develop a way to talk precisely about **how-to knowledge**, as opposed to geometry that talks about what is true.

> in computer science, we're in the business of formalizing this sort of how-to imperative knowledge, how to do stuff. 


## Managing complexity

> there are **techniques for controlling the complexity of these large systems**. And these techniques that are controlling complexity are what this course is really about. And in some sense, that's really what computer science is about.

> the constraints imposed in building large software systems are the limitations of our own minds. So in that sense, computer science is like an abstract form of engineering. It's the kind of engineering where you ignore the constraints that are imposed by reality.

> procedures are going to be our ways of talking about imperative knowledge.

> the third basic technique for controlling complexity, is making new languages. Because sometimes, when you're sort of overwhelmed by the complexity of a design, the way that you control that complexity is to pick a new design language. And the purpose of the new design language will be to highlight different aspects of the system. It will suppress some kinds of details and emphasize other kinds of details.

## LISP

> When somebody tells you they're going to show you a language, what you should say is, what I'd like you to tell me is what are the primitive elements? What does the language come with? Then, what are the ways you put those together? What are the means of combination? What are the things that allow you to take these primitive elements and build bigger things out of them? What are the ways of putting things together? And then, what are the means of abstraction? How do we take those complicated things and draw those boxes around them? How do we name them so that we can now use them as if they were primitive elements in making still more complex things?

> In fact, the way to think about this, is really what I'm doing when I write something like this is writing a tree. So this combination is a tree that has a plus and then a thee and then a something else and an eight and a two. And then this something else here is itself a little subtree that has a star and a five and a six. And the way to think of that is, really, **what's going on are we're writing these trees, and parentheses are just a way to write this two-dimensional structure as a linear character string**.

> So the key thing is you cannot tell, should not be able to tell, in general, the difference between things that are built in and things that are compound. Why is that? Because the things that are compound have an abstraction wrapper wrapped around them.

> Let me summarize. We started out with the idea that what we're going to be doing is expressing imperative knowledge. [...] We started out by looking at some primitive elements in addition and multiplication, some predicates for testing whether something is less-than or something's equal. And in fact, we saw really sneakily in the system we're actually using, these aren't actually primitives, but it doesn't matter. What matters is we're going to use them as if they're primitives. We're not going to look inside. We also have some primitive data and some numbers. 
> We saw some means of composition, means of combination, the basic one being composing functions and building combinations with operators and operands. 
> And there were some other things, like COND and "if" and "define." But the main thing about "define," in particular, was that it was the means of abstraction. It was the way that we name things. 


## Execution model (start at video Lecture 1B)

> if we're gonna understand processes and how we control them then we have to have a mapping from the mechanisms of this procedure into the way in which these processes behave. We're gonna have is a formal or semi-formal mechanical model whereby you understand how a machine could in fact in principle do this.


Shape of computation
space and time complexity "intuition"
iteration vs recursion
Iteration as a particular recursion where all the state are send to the next step in its parameters
State and where they are stored

> The reason why people think of programming is being hard of course that's because you're writing down a general rule which is going to be used for lots of instances.


> that's another thing you should sit down and work out and you should that's important it's important to see how to do this I want you to practice.


What is the chapter about

- Tools for managing complexity of large procedure
  - Black-box abstraction, used to suppress details
    - Generalisation, used to capture common patterns of doing things
  - Conventional interfaces
  - Making new language, Metalinguistic abstraction

Symbols
Combination
Operator
Operands
Operands can be compbination
DEFINE
Define a function
LAMBDA
COND
IF
Recursion
Block Structure (packaging internal inside of a definition)

Key takeaway


Quotes


Summarize






Sources and comments

- [Procedural knowledge - Wikipedia](https://en.wikipedia.org/wiki/Procedural_knowledge) 
- [ON COMPUTER SCIENCE AS "PROCEDURAL EPISTEMOLOGY" - Amodern](https://amodern.net/article/on-computer-science/) 
- Matthias Felleisen, Robert Bruce Findler, Matthew Flatt, and Shriram Krishnamurthi, “The structure and interpretation of the computer science curriculum,” Journal of Functional Programming  14.4 (July 2004), 365
  - https://cs.brown.edu/~sk/Publications/Papers/Published/fffk-htdp-vs-sicp-journal/paper.pdf
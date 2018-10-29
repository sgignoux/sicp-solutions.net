---
title: "Book Manifesto"
date: 2018-09-26T21:03:14+02:00
draft: true
---

- Very high quality code of he final results
- Clean code architecture
- Almost production ready
- With documentation
- Show also unclean code on the step to clean code
- No dumbing down
- Minimual theory
- Real runnable code
- From scratch, as little dependencies as possible
- No skipping of anything!
- written with tests first and without 3rd-party libraries.
- not about theory, its focus is runnable, working code.
- Clarity of explanation
- Show how it is build step by step, not just the result
- Break through layers of abstraction
- Identify incorrect assumptions
- complex programs are constructed by building, step by step, computational objects of increasing complexity
- incremental development and testing
- a modern, non-naive implementation
- reasonably fast
- foundational
- step by step, show challenges and tradeoff and decisions
- Accuracy in words
- Simple is not easy (https://www.infoq.com/presentations/Simple-Made-Easy)
- great introduction to the subject
- no CS degree, highly interested in interpreters and compilers, but intimidated by the existing literature.
- Showing the path and the why, not just the matured end resutl (ex of database)
- "How do you know this is correct?"
- Intuitive Understanding

Building an xxx in yyy
Coding
Programming
Writing
developing

from scratch
from the ground up
from the Bottom Up

Topics:

- OS
- File System
- Language
  - Strongly or weakly typed?
  - Garbage Collected?
  - Functional, OO, "normal", logic
- Compiler
  - http://web.stanford.edu/class/cs143/
- Write a version of the compiler in the language and have it compile itself
- parser
- interpreter
  - http://www.craftinginterpreters.com/
  - https://news.ycombinator.com/item?id=12553591
    - https://gpfault.net/posts/most-important-project.txt.html
- Memory allocators
- JIT
- Database
- SQL
- NoSQL
- Columnar
- Analytic oriented database
- Text Editor
- Hardware: CPU/Computer
- Network
- Log based database
- Profiler
- Debugger
- Streaming
- Event based
- Business Oriented (CRM, with invoicing, like gumroad)
- regex engine
  - https://news.ycombinator.com/item?id=12553591
- Benchmarking
  - https://blog.janestreet.com/core_bench-micro-benchmarking-for-ocaml/

Inspiration:

- https://news.ycombinator.com/item?id=18274235
- http://www.pbr-book.org/
- https://news.ycombinator.com/item?id=18277450
- https://blog.invisiblethings.org/2015/12/23/state_harmful.html (markdown to pdf)
- https://news.ycombinator.com/item?id=18282324
- http://aosabook.org/en/pypy.html
- https://news.ycombinator.com/item?id=18315292
- http://gameprogrammingpatterns.com/

https://www.ybrikman.com/writing/2014/05/29/must-see-tech-talks-for-every-programmer/

improve writing clarity: use debating society?

Books

https://pragprog.com/book/tpdsl/language-implementation-patterns

https://news.ycombinator.com/item?id=13079611

The way I would sum up interpreters and compilers, trying to put it as concisely as possible:
Step 1. Write a program that reads the input program into a data structure that exactly represents the language. You just wrote a parser.

Step 2. Write a program that operates on the data structure from (1) to execute the program. You just wrote an interpreter.

Step 3 (Optional): Write a program that converts the data structure from (1) into a different data structure that you can interpret more efficiently. You just wrote an optimizer.

Step 4 (Optional): Keep iterating on (3) until the output of your optimizer is machine code. You just wrote a compiler.

Not saying the above obviates the need for a book like this one (at all), I just had never thought of it in quite this way and wanted to write it down. :)

The author seems to be doing a good thing. Like he said, most of the write-ups on this subject are either ultra-heavy with theory or basically nothing with code examples. Doing interpreters piece-by-piece like in SICP or The Little Schemer series in an accessible language gradually giving them the code and theory they need is a good idea.

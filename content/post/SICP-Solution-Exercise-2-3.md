---
title: "SICP - Solution: Exercise 2.2"
date: 2019-01-05T07:09:58+02:00
draft: false
---

**Exercise 2.3:** Implement a representation for rectangles in a plane. (Hint: You may want to make use of Exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures will work using either representation?

**Solution**

Let's start by writing `perimeter-rect` and `area-rect` the way we would like to see them:

```scheme
(define (perimeter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))
```

These functions rely on basic caracteristic of a rectangle that we expect the rect implementation to provide.

Based from the description, we can't assume that the segment of the rectangle are parallel to the axis

Let's brainstorm a few possible representation:

- corner point, height, width and angle (5 dof)
- center point, height, width and angle (5 dof)
- first corner point, second corner point and width (5 dof)
- first corner point, second corner point and angle (5 dof)
- thee corner points: two segments bottom and left (6 dof, can be none rectangulary)
- four corners points: two segments top and bottom (8 dof, can be none rectangulary)

Overspecify will need to check some constraintes (like orthogonality)

It means that `perimeter-rect` and `area-rect` should be on the side of the representation of the rectangle side of the abstraction barrier.

What basic function do we expect on rect?

- create from which representation
  - corner, height, width, angle
  - tree points
- position of each corners
- angle
- width
- height

What is the public interface?
Are the constructor part of the public interface?

```scheme
(define (make-rect p h w a) (cons (cons h w) (cons p (cons a))))
```

The idea is to use cons of cons to store more than two values. I am not sure if there are a way to organize them that is "better".

todo: diagram

The getter gives a first level of abstraction barrier so that we don't have to care about HOW the data are stored, just WHAT is stored

It means that `width-rect` and `height-rect` should be on the abstracted, but the constructor are not. We could create constuctores that abstract the way the implementation is done and offer different ways to constructr a rectangle.

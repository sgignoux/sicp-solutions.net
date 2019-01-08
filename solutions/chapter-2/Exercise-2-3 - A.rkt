#lang racket

; --- Points ---
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (distance-point p1 p2)
  (sqrt
   (+ (sqr (- (x-point p1) (x-point p2)))
      (sqr (- (y-point p1) (y-point p2))))))

; Looks like vectors...
(define (dot-product p1 p2)
  (+ (* (x-point p1) (x-point p2))
     (* (y-point p1) (y-point p2))))

(define (magnitude p)
  (distance-point (make-point 0 0) p))

; --- Rectangles: first version ---
; This gives a first level of abstraction barrier so that we don't have to care about HOW the data are stored, just WHAT is stored

(define (make-rect origin height width angle)
  (cons (cons height width) (cons origin angle)))

(define (origin-rect r) (car (cdr r)))
(define (angle-rect  r) (cdr (cdr r)))

; Public interface

(define (height-rect r) (car (car r)))
(define (width-rect  r) (cdr (car r)))


; --- Independent from representation of Rect ---

(define (perimeter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))

; --- Test Rectangle 1 ---

(define origin1 (make-point 1 1))
(define height1 4.0)
(define width1 5.0)
(define angle1 0.2)

(define r1 (make-rect origin1 height1 width1 angle1))

(display "Rectangle 1: ") (newline)
(display "Perimeter: ") (display (perimeter-rect r1)) (newline)
(display "Area ") (display (area-rect r1)) (newline) (newline)

; --- Test Rectangle 2 ---

(define p4 (make-point 0 0))
(define p5 (make-point 10 -2))
(define p6 (make-point 1 5))

(define origin2 p4)
(define height2 (distance-point p4 p5))
(define width2  (distance-point p4 p6))
(define angle2  (atan (/ (y-point p5)
                         (x-point p5))))

(define r2 (make-rect origin2 height2 width2 angle2))

(display "Rectangle 2: ") (newline)
(display "Perimeter: ") (display (perimeter-rect r2)) (newline)
(display "Area ") (display (area-rect r2)) (newline) (newline)
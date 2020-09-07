#lang racket

(define (make-interval a b) (cons a b))


; -- 2.7 --
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

; --

(define (add-interval x y)
  (make-interval (+ (lower-bound x) 
                    (lower-bound y))
                 (+ (upper-bound x) 
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval 
                 (/ 1.0 (upper-bound y)) 
                 (/ 1.0 (lower-bound y)))))

; -- 2.8 --

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))


; --

(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

; -- 2.10 --


; (error "Points should make an rectangle.")

(define (div-interval2 x y)
  (if (or (and (< 0 (lower-bound x)) (> 0 (upper-bound x)))
          (and (> 0 (lower-bound x)) (< 0 (upper-bound x)))
          (and (< 0 (lower-bound y)) (> 0 (upper-bound y)))
          (and (> 0 (lower-bound y)) (< 0 (upper-bound y))))
      (error "One or more interval crossing zero.")
      (mul-interval x 
                    (make-interval 
                     (/ 1.0 (upper-bound y)) 
                     (/ 1.0 (lower-bound y))))))

; --- 2.11 ---

; 1. write x1, x2 and x3 for each of the cases
(define x1 (make-interval -2 -1))
(define x2 (make-interval -1 1))
(define x3 (make-interval 1 2))

; 2. idem for y
; 3. write a function to compare new implementation to old one for each test cases


; --  test --

(define r1 (make-interval 6.12 7.48))
(define r2 (make-interval (- 4.7 (* 4.7 (/ 5 100))) (+ 4.7 (* 4.7 (/ 5 100)))))

(define rp (div-interval (make-interval 1 1)
                         (add-interval (div-interval (make-interval 1 1)
                                                     r1)
                                       (div-interval (make-interval 1 1)
                                                     r2))))

(newline)
(define r3 (make-interval 100.0 101.0))
(define r4 (make-interval 22.0 23.0))

(display "r3=")  (display (width-interval r3)) (newline)
(display "r4=")  (display (width-interval r4)) (newline)
(display "mul=") (display (width-interval (mul-interval r3 r4))) (newline)
(display "div=") (display (width-interval (div-interval2 r3 r4))) (newline)

(define r5 (make-interval 100.0 101.0))
(define r6 (make-interval -0.2 0.3))

(display "r5=")  (display (width-interval r5)) (newline)
(display "r6=")  (display (width-interval r6)) (newline)
(define r7 (div-interval2 r5 r6))
(display "div=") (display (lower-bound r7)) (display ", ") (display (upper-bound r7)) (newline)

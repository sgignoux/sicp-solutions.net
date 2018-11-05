#lang racket

(define tolerance 0.00001)

(define (square x) (* x x))
(define (cube x)   (* x x x))
(define (fourth x) (* x x x x))
(define (fifth x)  (* x x x x x))

(define (average a b)
  (/ (+ a b) 2))

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

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (sqrt x)
  (fixed-point 
   (average-damp 
    (lambda (y) (/ x y)))
   1.0))

(define (cube-root x)
  (fixed-point 
   (average-damp 
    (lambda (y) 
      (/ x (square y))))
   1.0))

(define (fourth-root x)
  (fixed-point 
    (average-damp (average-damp 
    (lambda (y) 
      (/ x (cube y)))))
   1.0))

(define (fifth-root x) ; fail with one damp
  (fixed-point 
    (average-damp (average-damp 
    (lambda (y) 
      (/ x (fourth y)))))
   1.0))

(define (sixth-root x)
  (fixed-point 
    (average-damp (average-damp (average-damp 
    (lambda (y) 
      (/ x (fifth y))))))
   1.0))

;(display (sqrt 2)) (newline) (newline)
;(display (cube-root 2)) (newline) (newline)
;(display (fourth-root 2)) (newline) (newline)
;(display (fifth-root 2)) (newline) (newline)
;(display (sixth-root 2)) (newline) (newline)

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

(define (nth-root-damped x nth damp)
  (fixed-point 
    ((repeated average-damp damp) 
    (lambda (y) 
      (/ x (power y (- nth 1)))))
   1.0))

(display (nth-root-damped 2 64 6)) (newline)

(display (floor (log 64 2)))

(define (nth-root x nth)
  (fixed-point 
    ((repeated average-damp (floor (log nth 2))) 
    (lambda (y) 
      (/ x (power y (- nth 1)))))
   1.0))

(display (nth-root 2 258)) (newline)

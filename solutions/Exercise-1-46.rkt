#lang racket

(define (iterative-improve-A good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess) (iter guess)))

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess)
    (let ((next (improve-guess guess)))
      (if (good-enough? guess next)
          next
          (iter next))))
  (lambda (guess) (iter guess)))


; --- sqrt ---

(define (square x) (* x x))

(define (average x y) 
  (/ (+ x y) 2))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? next guess)
    (< (abs (- (square next) x)) 0.001))
  ((iterative-improve good-enough? improve) 1.0))

(display (sqrt 11))(newline)  

; --- fixed-point ---
(newline)  
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))

  (define (improve-guess guess)
    (f guess))
  
  (define (try guess)
    (display guess) (newline)
    (let ((next (improve-guess guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))

(define (sqrt-fixed-point x)
  (fixed-point 
   (average-damp 
    (lambda (y) (/ x y)))
   1.0))

(display (sqrt-fixed-point 11))(newline)  
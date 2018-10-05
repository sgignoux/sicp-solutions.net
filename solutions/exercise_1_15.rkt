#lang r5rs

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle step)
  (display step) (display ": ") (display angle) (newline)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0) (+ step 1)))))

; (display (sine 12.15 1))

(define (sine-count-step angle step)
  (if (not (> (abs angle) 0.1))
      step
      (sine-count-step (/ angle 3.0) (+ step 1))))

(display       12.15 ) (display ": ") (display (sine-count-step       12.15 1)) (newline)
(display      120.15 ) (display ": ") (display (sine-count-step      120.15 1)) (newline)
(display     1200.15 ) (display ": ") (display (sine-count-step     1200.15 1)) (newline)
(display    12000.15 ) (display ": ") (display (sine-count-step    12000.15 1)) (newline)
(display   120000.15 ) (display ": ") (display (sine-count-step   120000.15 1)) (newline)
(display  1200000.15 ) (display ": ") (display (sine-count-step  1200000.15 1)) (newline)
(display 12000000.15 ) (display ": ") (display (sine-count-step 12000000.15 1)) (newline)

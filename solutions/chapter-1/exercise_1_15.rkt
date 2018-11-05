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


(display "| ") (display "a         ") (display " | ") (display "number of steps              ") (display " |") (newline)
(display "| ") (display "----------") (display " | ") (display "-----------------------------") (display " |") (newline)
(display "| ") (display       12 ) (display " | ") (display (sine-count-step       12 1)) (display " |") (newline)
(display "| ") (display      120 ) (display " | ") (display (sine-count-step      120 1)) (display " |") (newline)
(display "| ") (display     1200 ) (display " | ") (display (sine-count-step     1200 1)) (display " |") (newline)
(display "| ") (display    12000 ) (display " | ") (display (sine-count-step    12000 1)) (display " |") (newline)
(display "| ") (display   120000 ) (display " | ") (display (sine-count-step   120000 1)) (display " |") (newline)
(display "| ") (display  1200000 ) (display " | ") (display (sine-count-step  1200000 1)) (display " |") (newline)
(display "| ") (display 12000000 ) (display " | ") (display (sine-count-step 12000000 1)) (display " |") (newline)

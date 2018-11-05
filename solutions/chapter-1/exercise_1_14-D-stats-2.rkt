#lang r5rs

(define (count-change-steps amount)
  (cc-count-steps amount 5))

(define (pad char n)
 (display char)
  (if (>= 0 n)
      0
      (pad char (- n 1))))

(define (cc-count-steps amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0))
         1)
        (else 
         (+ (cc-count-steps amount (- kinds-of-coins 1))
            (cc-count-steps (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)
            1))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (T2 n)
  (+ (/ (+ (* n n) (* 7 n)) 5.0) 1))

(display "| ") (display    "1") (display " | ") (display(cc-count-steps    1 2)) (display " | ") (display(T2     1)) (display " |") (newline)
(display "| ") (display   "10") (display " | ") (display(cc-count-steps   21 2)) (display " | ") (display(T2    11)) (display " |") (newline)
(display "| ") (display   "10") (display " | ") (display(cc-count-steps   21 3)) (display " | ") (display(T2    10)) (display " |") (newline)
(display "| ") (display  "100") (display " | ") (display(cc-count-steps  100 2)) (display " | ") (display(T2   100)) (display " |") (newline)
(display "| ") (display "1000") (display " | ") (display(cc-count-steps 1000 2)) (display " | ") (display(T2  1000)) (display " |") (newline)


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


(display "| ") (display   "10") (display " | ") (display (count-change-steps   10)) (display " |") (newline)
(display "| ") (display  "100") (display " | ") (display (count-change-steps  100)) (display " |") (newline)
(display "| ") (display  "200") (display " | ") (display (count-change-steps  200)) (display " |") (newline)
(display "| ") (display  "300") (display " | ") (display (count-change-steps  300)) (display " |") (newline)
(display "| ") (display  "400") (display " | ") (display (count-change-steps  400)) (display " |") (newline)
(display "| ") (display  "500") (display " | ") (display (count-change-steps  500)) (display " |") (newline)
(display "| ") (display  "600") (display " | ") (display (count-change-steps  600)) (display " |") (newline)
(display "| ") (display  "700") (display " | ") (display (count-change-steps  700)) (display " |") (newline)
(display "| ") (display  "800") (display " | ") (display (count-change-steps  800)) (display " |") (newline)
(display "| ") (display  "900") (display " | ") (display (count-change-steps  900)) (display " |") (newline)
;(display "| ") (display "1000") (display " | ") (display (count-change-steps 1000)) (display " |") (newline)
;(display "| ") (display "1100") (display " | ") (display (count-change-steps 1100)) (display " |") (newline)
;(display "| ") (display "1200") (display " | ") (display (count-change-steps 1200)) (display " |") (newline)
;(display "| ") (display "1300") (display " | ") (display (count-change-steps 1300)) (display " |") (newline)
;(display "| ") (display "1400") (display " | ") (display (count-change-steps 1400)) (display " |") (newline)
;(display "| ") (display "1500") (display " | ") (display (count-change-steps 1500)) (display " |") (newline)
;(display "| ") (display "1600") (display " | ") (display (count-change-steps 1600)) (display " |") (newline)
;(display "| ") (display "1700") (display " | ") (display (count-change-steps 1700)) (display " |") (newline)
;(display "| ") (display "1800") (display " | ") (display (count-change-steps 1800)) (display " |") (newline)
;(display "| ") (display "1900") (display " | ") (display (count-change-steps 1900)) (display " |") (newline)
;(display "| ") (display "2000") (display " | ") (display (count-change-steps 2000)) (display " |") (newline)
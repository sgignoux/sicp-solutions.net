#lang r5rs

(define (count-change amount)
  (cc amount 5 0))

(define (pad char n)
 (display char)
  (if (>= 0 n)
      0
      (pad char (- n 1))))

(define (cc amount kinds-of-coins depth)
  (pad "--" depth) (display " (cc ") (display amount) (display " ") (display kinds-of-coins) (display ")") (newline)
  (cond ((= amount 0) (display "**") (newline) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0))
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1) (+ 1 depth))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins
                (+ 1 depth))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


(display (count-change 11)) (newline)

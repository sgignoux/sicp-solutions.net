#lang r5rs

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(display (fast-expt 9 7))
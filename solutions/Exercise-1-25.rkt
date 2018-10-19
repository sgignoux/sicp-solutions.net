#lang racket
(require racket/trace)


(define (fast-expt b n)
  ;(display (string-append "(fast-expt-iter " (number->string b) " " (number->string n) ") -> " (number->string (expt b n))))(newline)
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

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;(display (expmod 70309661 100000039 100000039))
;(display (fast-expt 550 108))(newline)
(display (fast-expt 941 1009))(newline)
(display (remainder (fast-expt 55 1008) 1009))(newline)
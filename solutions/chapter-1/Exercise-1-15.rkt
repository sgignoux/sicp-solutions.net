#lang racket/base
(require racket/trace)

(define (fast-expt b n)
  (display (string-append "(fast-expt-iter " (number->string b) " " (number->string n) ") -> " (number->string (expt b n))))(newline)
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

(display (fast-expt 9 7)) (newline)


(define (fast-expt-iter a b n)
  ; (display (string-append "(fast-expt-iter " (number->string a) " " (number->string b) " " (number->string n) ") -> " (number->string (* a (expt b n)))))(newline)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-expt-iter a (* b b) (/ n 2)))
        (else
         (fast-expt-iter (* a b) b (- n 1)))))

(trace fast-expt-iter)

(display (fast-expt-iter 1 9 7)) (newline)

(define (expt2 b n)
  (if (= n 0) 
      1 
      (* b (expt2 b (- n 1)))))

(trace expt2)

(display (expt2 9 7)) (newline)
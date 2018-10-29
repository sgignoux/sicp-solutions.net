#lang racket

(define (cont-frac-recur n d k)
  (define (recur i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recur (+ 1 i))))))
  (recur 1)) 

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (sub1 i) (/ (n i) (+ result (d i))))))
  (iter (sub1 k) (/ (n k) (d k))))

(define (display-cont-frac-recur n)
  (display "|") (display n) (display "|")(display (cont-frac-recur (lambda (i) 1.0)
                          (lambda (i) 1.0)
                          n))(display "|")  (newline))

(display 0.61803398875) (newline)

(display-cont-frac-recur 4)
(display-cont-frac-recur 5)
(display-cont-frac-recur 6)
(display-cont-frac-recur 7)
(display-cont-frac-recur 8)
(display-cont-frac-recur 9)
(display-cont-frac-recur 10)
(display-cont-frac-recur 11)
(display-cont-frac-recur 12)
(display-cont-frac-recur 13)


(display (cont-frac-iter (lambda (i) 1.0)
                         (lambda (i) 1.0)
                         12)) (newline)
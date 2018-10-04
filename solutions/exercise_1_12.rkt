#lang r5rs


(define (pascal n i)
  (cond ((= n 1) 1)
        ((or (= i 1) (= i n)) 1)
        (else (+ (pascal (- n 1)  (- i 1))
                 (pascal (- n 1) i)))))

(define (display-pascal-row n)
  (define (column-iter i)
    (display (pascal n i)) (display " ")
    (if (= i n)
        (newline)
        (column-iter (+ i 1))))
  (column-iter 1))

(define (display-pascal n)
  (define (display-pascal-iter i)
    (display-pascal-row i)
    (if (= i n)
        (newline)
        (display-pascal-iter (+ i 1))))
  (display-pascal-iter 1))

(display-pascal 10)
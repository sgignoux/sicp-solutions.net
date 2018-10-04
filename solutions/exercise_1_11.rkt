#lang r5rs

(define (f-recursive n) 
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))


(display (f-recursive 1)) (newline)
(display (f-recursive 2)) (newline)
(display (f-recursive 3)) (newline)
(display (f-recursive 4)) (newline)
(display (f-recursive 5)) (newline)
(display (f-recursive 6)) (newline)
(display (f-recursive 7)) (newline)

(define (f-iterative n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))

 (newline)
(display (f-iterative 1)) (newline)
(display (f-iterative 2)) (newline)
(display (f-iterative 3)) (newline)
(display (f-iterative 4)) (newline)
(display (f-iterative 5)) (newline)
(display (f-iterative 6)) (newline)
(display (f-iterative 7)) (newline)
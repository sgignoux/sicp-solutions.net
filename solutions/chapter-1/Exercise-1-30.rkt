#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-iter f (+ a (/ dx 2.0)) add-dx b) 
     dx))

; assuming n is even
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x h h))
  (* (+ (f a)
        (* 2 (sum-iter f a       add-2h b))
        (* 4 (sum-iter f (+ a h) add-2h b))
        (f b))
     (/ h 3)))



(define (cube x) (* x x x))

(display (integral cube 0 1 0.01)) (newline)
(display (integral cube 0 1 0.001)) (newline)

(display (integral-simpson cube 0 1.0 100)) (newline)
(display (integral-simpson cube 0 1.0 1000)) (newline)
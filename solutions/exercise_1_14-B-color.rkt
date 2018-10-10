#lang r5rs

(define (count-change amount)
  (cc amount 5 0 "-"))

(define (cc-id amount kinds-of-coins count)
  (string-append "\"[" (number->string count) "] "(cc-label amount kinds-of-coins) "\""))

(define (cc-label amount kinds-of-coins)
   (string-append "(cc " (number->string amount) " " (number->string kinds-of-coins) ")"))

(define (get-color amount kinds-of-coins)
  (cond ((= amount 0)         "color=gray80")
        ((= kinds-of-coins 1) "color=antiquewhite")
        ((= kinds-of-coins 2) "color=deepskyblue2")
        ((= kinds-of-coins 3) "color=chocolate1")
        (else " ")))

(define (cc amount kinds-of-coins depth parent)
  (if (not (eq? parent "-")) (display (string-append parent " -> "(cc-id amount kinds-of-coins depth) "; ")))
  (display (string-append (cc-id amount kinds-of-coins depth)  " [label=\"" (cc-label amount kinds-of-coins) "\"," (get-color amount kinds-of-coins) "];") )
  (newline)
  (cond ((= amount 0) 1);
        ((or (< amount 0) 
             (= kinds-of-coins 0))
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1)
                (+ 1 depth)
                (cc-id amount kinds-of-coins depth))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins
                (+ 1 depth)
                (cc-id amount kinds-of-coins depth))))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(display "digraph G {") (newline)
(display "node [color = gray95,style=filled];") (newline)
(display "graph [ranksep=0.3,size=7];") (newline)
(display "node [color = gray95,style=filled,fontsize=9,shape=box, margin=.08, width=0, height=0 ];") (newline)
(display "edge [penwidth=.1, arrowsize=0.5];") (newline)
(cc 12 2 0 "-")
(display "}") (newline)
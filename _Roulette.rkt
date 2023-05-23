#lang racket

(define (pick x)
  (cond
  [(= x 1) "Python"]
  [(= x 2) "Java"]
  [(= x 3) "Racket"]
  [(= x 4) "C"]
  [(= x 0) "Javascript"]) 
)

(pick (random 5))
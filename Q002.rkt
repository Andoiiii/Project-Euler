#lang lazy
; gonna have to pull out lazy racket for this one...
; there is a cool trick you can do to generate fibs:
; Fibs = 1, 2, 3, 5 ...
; Fibs =    1, 2, 3, 5 ... 
; basically you can take a delayed copy of itself to make itself
(define pre-fib (map + (cons 0 fib) fib))
(define fib (cons 1 pre-fib))
(define Fibs (cdr fib))

; Generative Framework - foldl with extra steps ig.
(define (GenFold stepper s acc done?) 
  (cond
    [(or (empty? s) (done? (car s))) acc]
    [#t (GenFold stepper (cdr s) (stepper (car s) acc) done?)]
    ))

; and to just plop it in... 
(define Solution 
  (GenFold
    (λ(x acc) (if (= 0 (remainder x 2)) (+ x acc) acc))
    Fibs
    0
    (λ(x) (>= x 4000000))
  ))
(!! Solution) ;force evaluation lol
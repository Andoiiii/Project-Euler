; I think I like racket the most tbh
; It's also that I've solved this problem here before ig
#lang lazy

(define (q-prime-gen x) (cons (+ 1 (* 6 x)) (cons (+ 5 (* 6 x)) (q-prime-gen (+ x 1)))))
(define quasi-primes (cons 2 (cons 3 (cdr (q-prime-gen 0)))))

(define (display-stream s)
  (cond
  [(empty? s) (void)]
  [#t (begin (displayln (car s)) (sleep 0.5) (display-stream (cdr s)))]
))

; factorize x using quasi-prime stream s
(define (factorize x s) 
  (cond
    [(= x 1) empty]
    [(= 0 (remainder x (car s))) (cons (car s) (factorize (/ x (car s)) s))]
    [#t (factorize x (cdr s))]
  )
)

(define (prime-factorize x) (display-stream (factorize x quasi-primes)))
; factorization: 71 x 839 x 1471 x 6857
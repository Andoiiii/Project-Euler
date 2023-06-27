#lang lazy

(require math/number-theory)
; Recycle Prime Generator
(define (q-prime-gen x) (cons (+ 1 (* 6 x)) (cons (+ 5 (* 6 x)) (q-prime-gen (+ x 1)))))
(define quasi-primes (cons 2 (cons 3 (cdr (q-prime-gen 0)))))

; My prime function is... a lot slower. Probably memory overhead... :(
; (define (is-prime x)
;   (define (is-prime-h x q-prime-stream) 
;     (cond
;       [(> (sqrt (car q-prime-stream)) x) #t]
;       [(= x (car q-prime-stream)) #t]
;       [(= 0 (remainder x (car q-prime-stream))) #f]
;       [#t (is-prime-h x (cdr q-prime-stream))]
;     )
;   )
;   (!! (is-prime-h x quasi-primes))
; )

; Library one is SO much faster i should be ashamed.
(define primes (filter prime? quasi-primes))

(define (display-stream s)
  (cond
  [(empty? s) (void)]
  [#t (begin (displayln (car s)) (sleep 0.5) (display-stream (cdr s)))]
))

(define (custom-fold stream acc step stop)
  (if (stop (car stream)) acc
    (custom-fold (cdr stream) (!! (step (car stream) acc)) step stop))
)
(define (prime-sum up-to)
  (custom-fold primes 0 (λ(x acc) (+ x acc)) (λ(x) (> x up-to)))
)
(prime-sum 2000000)
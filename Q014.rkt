#lang racket
; Longest Length Collatz Sequence with starting term < 1,000,000
; Now we could be just naive and check manually for 1,000,000 terms
; But this is just ITCHING to become a DP Problem!
; We will first generate an hashmap of the 1,000,000 numbers and their corresponding length

; Return a hashmap containing the length of a given assoc sequence
(define (add-to-collatz-assoc x collatz-hash)
  (cond
    [(hash-ref collatz-hash x (λ() #f)) ;(printf "Seen ~a\n" x) 
                                        collatz-hash] ;already in there, cool
    [(= x 1)  (hash-set collatz-hash 1 1)] ;base case
    [(odd? x) (define recurse-ind (+ (* 3 x) 1)) ; grab value from 3x+1 case
              (define recursed-list (add-to-collatz-assoc recurse-ind collatz-hash))
              ; (printf "Adding ~a\n" x)
              (hash-set recursed-list x (+ 1 (hash-ref recursed-list recurse-ind)))] ; and attach
    [(even? x) (define recurse-ind (/ x 2)) ; grab value from x/2 case
              (define recursed-list (add-to-collatz-assoc recurse-ind collatz-hash))
              ; (printf "Adding ~a\n" x)
              (hash-set recursed-list x (+ 1 (hash-ref recursed-list recurse-ind)))] ; on it goes
    )
)`  1

; Now Ensure all entries from 1 to x are in the darn thing
(define (populate-assoc-until x)
  (foldl (λ(x acc) (add-to-collatz-assoc x acc)) (hash) (reverse (build-list x add1)))
)

; And now just return the largest within the range
(define (return-largest-collatz ass-lst range)
  (println "Filterin!")
  (define filtered-assoc (filter (λ(x) (< (car x) range)) ass-lst)) ;out with all that is out of range
  (println "Sortin!")
  (define sorted-assoc (sort filtered-assoc (λ(a b) (> (cdr a) (cdr b))))) ;sort largest first
  (car sorted-assoc)
)

; And Now the Together...
(define (main x)
  (return-largest-collatz (hash->list (populate-assoc-until x)) x))
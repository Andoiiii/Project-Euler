#lang racket
; We can probably figure out a recursive solution for this!
; For example, 6XX = six + hundred and + (XX)

(define (1digit->length digit)
    (match digit 
        [1 3] [2 3] [3 5] [4 4] [5 4] [6 3] [7 5] [8 5] [9 4]
        [0 0] ; Zero is 4, but Zero also means nothing here. So 0 it is
))

(define (2digit->length num)
    (cond
        [(< num 10) (1digit->length num)] ; Oops, its actually 1 digit.
        [(= 10 num) 3]
        [(= 11 num) 6]
        [(= 12 num) 6]
        [(= 13 num) 8]
        [(= 14 num) 8]
        [(= 15 num) 7]
        [(= 16 num) 7]
        [(= 17 num) 9]
        [(= 18 num) 8]
        [(= 19 num) 8]
        [(and (>= num 20) (< num 30)) (+ 6 (1digit->length (- num 20)))] ; twenty
        [(and (>= num 30) (< num 40)) (+ 6 (1digit->length (- num 30)))] ; thirty
        [(and (>= num 40) (< num 50)) (+ 5 (1digit->length (- num 40)))] ; forty 
        [(and (>= num 50) (< num 60)) (+ 5 (1digit->length (- num 50)))] ; fifty
        [(and (>= num 60) (< num 70)) (+ 5 (1digit->length (- num 60)))] ; sixty
        [(and (>= num 70) (< num 80)) (+ 7 (1digit->length (- num 70)))] ; seventy
        [(and (>= num 80) (< num 90)) (+ 6 (1digit->length (- num 80)))] ; eighty
        [(and (>= num 90) (< num 100)) (+ 6 (1digit->length (- num 90)))] ; ninety
))

(define (3digit->length num)
    (+ 
        (1digit->length (quotient num 100)) ; X
        7 ; Hundred
        (if (= (remainder num 100) 0) 0 3) ; And (if not 0)
        (2digit->length (remainder num 100));  XX
    )
)

(define (num->length x)
    (cond
        [(< x 10)  (1digit->length x)]
        [(< x 100) (2digit->length x)]
        [(< x 1000) (3digit->length x)]
        [(= x 1000) (+ 3 8)] ; one thousand
    )
)

; Final Solution
(foldl
    (λ(x acc) (+ (num->length x) acc))
    0
    (build-list 1000 add1)
)


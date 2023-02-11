;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex16) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define days-in-month (list 31 28 31 30 31 30 31 31 30 31 30 31))

; day-within-year: Number Number Number -> Number
; purpose: produces day of the year for that date
(check-expect (day-within-year 2001 9 11) 254)
(check-expect (day-within-year 2000 9 11) 255)
(check-expect (day-within-year 2001 3 1) (+ 31 28 1))
(check-expect (day-within-year 2000 3 1) (+ 31 29 1))
(check-expect (day-within-year 2001 2 28) (+ 31 28))
(check-expect (day-within-year 2000 2 28) (+ 31 28))

(define (leap-year? year)
  (cond
    [(zero? (remainder year 100)) (zero? (remainder year 400))]
    [else (zero? (remainder year 4))]))

(define (days-till-month month year days-in-month)
  (cond
    [(zero? month) 0]
    [(positive? month) (+ (first days-in-month)
                          (days-till-month (sub1 month) year (rest days-in-month))
                          (if (and (= month 2) (leap-year? year))
                              1
                              0))]))

(define (day-within-year year month day)
  (+ day
     (days-till-month (sub1 month) year days-in-month)))
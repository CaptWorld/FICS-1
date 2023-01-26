;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; middle-of-three: Number Number Number -> Number
; Purpose:  produces the number that would be between the other two numbers
;   if they were listed in non-decreasing order
; Examples:
(check-expect (middle-of-three 1 3 2) 2)
(check-expect (middle-of-three 0 -1 1) 0)
(check-expect (middle-of-three -1000 -999 -999) -999)

(define (my-max x y)
  (if (> x y) x y))

(define (my-min x y)
  (if (> x y) y x))

(define (middle-of-three x y z)
  (cond
    [(>= (my-max x y) z) (my-max (my-min x y) z)]
    [else (my-max x y)]))

(check-expect (middle-of-three 2 3 1) 2)
(check-expect (middle-of-three 3 2 3) 3)
(check-expect (middle-of-three 1 2 3) 2)
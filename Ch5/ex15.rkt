;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex15) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; unique-right: (Listof Any) -> (Listof Any)
; purpose: produces a list which has all but the rightmost occurrence of each value
;          removed
(check-expect (unique-right (list 1 4 2 1 5 4))
              (list 2 1 5 4))
(check-expect (unique-right (list 1 4 2))
              (list 1 4 2))
(check-expect (unique-right (list 1 1 1 1 1))
              (list 1))

(define (unique-right lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (cond
                   [(in? (first lst) (rest lst)) (unique-right (rest lst))]
                   [else (cons (first lst) (unique-right (rest lst)))])]))


(define (in? x lst)
  (cond
    [(empty? lst) #false]
    [(cons? lst) (or (eq? x (first lst))
                     (in? x (rest lst)))]))
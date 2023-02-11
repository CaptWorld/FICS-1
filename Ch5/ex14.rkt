;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex14) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; unique-left: (Listof Any) -> (Listof Any)
; purpose: a list which has all but the leftmost occurrence of each value removed from
;          the rest of the list lst
(check-expect (unique-left (list 1 4 2 1 5 4))
              (list 1 4 2 5))
(check-expect (unique-left (list 1 4 2))
              (list 1 4 2))
(check-expect (unique-left (list 1 1 1 1 1))
              (list 1))

(define (unique-left lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (cons (first lst)
                       (unique-left (rem (first lst) (rest lst))))]))

(define (rem x lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (cond
                  [(eq? x (first lst)) (rem x (rest lst))]
                  [else (cons (first lst) (rem x (rest lst)))])]))
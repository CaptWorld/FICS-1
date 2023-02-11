;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex21) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; to-ordered: (Listof Number) -> (Listof Number)
; purpose: produces ordered list out of non-necessarily-ordered list lst
(check-expect (to-ordered empty) empty)
(check-expect (to-ordered (list -1)) (list -1))
(check-expect (to-ordered (list -1 0 1)) (list -1 0 1))
(check-expect (to-ordered (list 0 0 1)) (list 0 0 1))
(check-expect (to-ordered (list 0 1 -1)) (list -1 0 1))
(check-expect (to-ordered (list 1 0 -1)) (list -1 0 1))
(check-expect (to-ordered (list 1 -1 0)) (list -1 0 1))
(check-expect (to-ordered (list 1 -1 -1 -2 3 -100 -101 99))
              (list -101 -100 -2 -1 -1 1 3 99))

(define (place-at-proper-pos x o-lst)
  (cond
    [(empty? o-lst) (list x)]
    [(cons? o-lst) (cond
                     [(<= x (first o-lst)) (cons x o-lst)]
                     [(> x (first o-lst)) (cons (first o-lst)
                                                (place-at-proper-pos x (rest o-lst)))])]))

(define (to-ordered lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (place-at-proper-pos (first lst) (to-ordered (rest lst)))]))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex18) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; drop-first: (Listof Any) Number -> (Listof Any)
; purpose: drops the first n elements from lst if len(lst) <= n,
;          else, return empty list
(check-expect (drop-first (list 1 "a" 'bcd-efg) 4)
              empty)
(check-expect (drop-first (list 1 "a" 'bcd-efg) 3)
              empty)
(check-expect (drop-first (list 1 "a" 'bcd-efg) 2)
              (list 'bcd-efg))
(check-expect (drop-first (list 1 "a" 'bcd-efg) 1)
              (list "a" 'bcd-efg))
(check-expect (drop-first (list 1 "a" 'bcd-efg) 0)
              (list 1 "a" 'bcd-efg))

(define (drop-first lst n)
  (cond
    [(empty? lst) empty]
    [(zero? n) lst]
    [(cons? lst) (drop-first (rest lst) (sub1 n))]))
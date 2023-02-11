;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex19) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; sublist: (Listof Any) Number Number -> (Listof Any)
; purpose: produces list of elements in lst whose index >= n and < m
(check-expect (sublist (list 1 "a" 'b-c) 0 4)
              (list 1 "a" 'b-c))
(check-expect (sublist (list 1 "a" 'b-c) 0 3)
              (list 1 "a" 'b-c))
(check-expect (sublist (list 1 "a" 'b-c) 0 2)
              (list 1 "a"))
(check-expect (sublist (list 1 "a" 'b-c) 0 1)
              (list 1))
(check-expect (sublist (list 1 "a" 'b-c) 0 0)
              empty)
(check-expect (sublist (list 1 "a" 'b-c) 1 0)
              empty)
(check-expect (sublist (list 1 "a" 'b-c) 1 3)
              (list "a" 'b-c))
(check-expect (sublist (list 1 "a" 'b-c) 2 3)
              (list 'b-c))
(check-expect (sublist (list 1 "a" 'b-c) 3 4)
              empty)

(define (keep-first lst n)
  (cond
    [(empty? lst) empty]
    [(zero? n) empty]
    [(cons? lst) (cons (first lst) (keep-first (rest lst) (sub1 n)))]))

(define (drop-first lst n)
  (cond
    [(empty? lst) empty]
    [(zero? n) lst]
    [(cons? lst) (drop-first (rest lst) (sub1 n))]))

(define (sublist lst n m)
  (drop-first (keep-first lst m) n))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex17) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;Template Function
;(define (template-function lst n)
;  (cond
;    [(empty? lst) ..lst/n..]
;    [(zero? n) ..lst/n..]
;    [(cons? lst)
;           ..(first lst)..(sub1 n)..
;           ..(template-function (rest lst) n)..
;           ..(template-function lst (sub1 n))..
;           ..(template-function (rest lst) (sub1 n))..

; keep-first: (Listof Any) Number -> (Listof Any)
; purpose: returns first n elements of list lst if n <= len(lst) else, return lst
(check-expect (keep-first (list 1 "a" 'bcd-efg) 4)
              (list 1 "a" 'bcd-efg))
(check-expect (keep-first (list 1 "a" 'bcd-efg) 3)
              (list 1 "a" 'bcd-efg))
(check-expect (keep-first (list 1 "a" 'bcd-efg) 2)
              (list 1 "a"))
(check-expect (keep-first (list 1 "a" 'bcd-efg) 1)
              (list 1))
(check-expect (keep-first (list 1 "a" 'bcd-efg) 0)
              empty)

(define (keep-first lst n)
  (cond
    [(empty? lst) empty]
    [(zero? n) empty]
    [(cons? lst) (cons (first lst) (keep-first (rest lst) (sub1 n)))]))
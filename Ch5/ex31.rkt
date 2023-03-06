;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex31) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; cross: (Listof T) (Listof Z) -> (Listof (T Z))
; purpose: consumes two lists, lst1 & lst2, of distinct values, and produces a list of
;          two-element lists consisting of one value from the
;          first list and one value from the second list
(check-expect (cross '(a b c) '(1 2))
              '((a 1) (a 2) (b 1) (b 2) (c 1) (c 2)))
(check-expect (cross '(a b c) empty)
              empty)
(check-expect (cross empty empty)
              empty)

(define (cross lst1 lst2)
  (foldr (lambda (f r) (foldr cons
                              r
                              (map (lambda (x) (list f x)) lst2)))
         empty
         lst1))
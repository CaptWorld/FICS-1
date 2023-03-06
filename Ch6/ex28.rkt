;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex28) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; my-filter: (X -> Boolean) (Listof X) -> (Listof X)
; purpose: produces list of elements from lst, which satisfies the predicate pred
(check-expect (my-filter even? '(1 2 3 4))
              '(2 4))
(check-expect (my-filter zero? '(1 2 3 4))
              empty)
(check-expect (my-filter number? '(1 2 3 4 a))
              '(1 2 3 4))

(define (my-filter pred lst)
  (foldr (lambda (x y) (if (pred x)
                           (cons x y)
                           y))
         empty
         lst))
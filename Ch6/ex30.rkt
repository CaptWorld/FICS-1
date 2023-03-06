;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex30) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
  (foldr (lambda (f r)
           (cons f
                 (filter (lambda (x) (not (equal? x f)))
                         r)))
         empty
         lst))

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
  (foldr (lambda (f r)
           (cond
             [(foldr (lambtda (f1 r1) (or (= f1 f) r1)) #false r) r]
             [else (cons f r)]))
         empty
         lst))
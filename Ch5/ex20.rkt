;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex20) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; intersection: (Listof Number) (Listof Number) -> (Listof Number)
; purpose: produces an set represented by ordered list containing numbers present in
;          both sets lst1 & lst2 represented by ordered lists
(check-expect (intersection (list 1 2) (list 3 4))
              empty)
(check-expect (intersection (list 1 3) (list 2 4))
              empty)
(check-expect (intersection (list 1 2) (list 2 3))
              (list 2))
(check-expect (intersection (list 1 3 5) (list 3 5 9))
              (list 3 5))
(check-expect (intersection (list 100 200 300) (list 100 200 4000))
              (list 100 200))
(check-expect (intersection (list 100 200 300) (list 100 200 300))
              (list 100 200 300))
(check-expect (intersection (list 5 7 9) (list 3 9 22))
              (list 9))
(check-expect (intersection (list 25) (list 3 9 22))
              empty)
(check-expect (intersection (list 1) (list 1 2))
              (list 1))

; bounded above by len(lst1) + len(lst2)
(define (intersection lst1 lst2)
  (cond
    [(empty? lst1) empty]
    [(empty? lst2) empty]
    [(cons? lst1) (cond
                    [(< (first lst1) (first lst2)) (intersection (rest lst1) lst2)]
                    [(= (first lst1) (first lst2)) (cons (first lst1)
                                                         (intersection (rest lst1)
                                                                       (rest lst2)))]
                    [(> (first lst1) (first lst2)) (intersection lst1 (rest lst2))])]))


; subset: (Listof Number) (Listof Number) -> Boolean
; purpose: check if set lst1 is subset of set lst2, where both sets are
;          represented by ordered lists
(check-expect (subset empty (list 3 4))
              #true)
(check-expect (subset (list 1 2) (list 3 4))
              #false)
(check-expect (subset (list 1 3) (list 2 4))
              #false)
(check-expect (subset (list 1 2) (list 2 3))
              #false)
(check-expect (subset (list 1 3 5) (list 3 5 9))
              #false)
(check-expect (subset (list 100 200 300) (list 100 200 4000))
              #false)
(check-expect (subset (list 100 200 300) (list 100 200 300))
              #true)
(check-expect (subset (list 5 7) (list 3 5 7 9 22))
              #true)
(check-expect (subset (list 25) (list 3 9 22))
              #false)
(check-expect (subset (list 1) (list 1 2))
              #true)
(check-expect (subset (list 2) (list 1 2))
              #true)

; bounded above by max(len(lst1), len(lst2))
(define (subset lst1 lst2)
  (condt
    [(empty? lst1) #true]
    [(empty? lst2) #false]
    [(cons? lst1) (cond
                    [(< (first lst1) (first lst2)) #false]
                    [(= (first lst1) (first lst2)) (subset (rest lst1) (rest lst2))]
                    [(> (first lst1) (first lst2)) (subset lst1 (rest lst2))])]))
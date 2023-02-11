;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex13) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; substitute: Any Any (Listof Any) -> (Listof Any)
; purpose: substitutes x with y in the list lst
(check-expect (substitute 3 "three" (list "four" 3 4 "three" 3))
              (list "four" "three" 4 "three" "three"))
(check-expect (substitute 3 "three" empty)
              empty)
(check-expect (substitute 3 "three" (list "four"))
              (list "four"))
              
(define (substitute x y lst)
  (cond
    [(empty? lst) empty]
    [(cons? lst) (cons (if (eq? x (first lst))
                           y
                           (first lst))
                       (substitute x y (rest lst)))]))
;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(first '((1 2) (3 4)))
; => (list 1 2)

(rest '((1 2) (3 4)))
; => (list (list 3 4))

'(1 (+ 1 2) 5)
; => (list '1 '(+ 1 2) '5)
; => (list 1 (list '+ 1 2) 5)

(list 1 (+ 1 2) 5)
; => (list 1 3 5)
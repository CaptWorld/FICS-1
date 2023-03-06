;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(folder cons empty mylist)
; =>* mylist
(check-expect (foldr cons empty '(1 2))
              '(1 2))
; (foldr cons mylist1 mylist2)
; =>* (append mylist2 mylist1)
(check-expect (foldr cons '(3 4) '(1 2))
              (append '(1 2) '(3 4)))
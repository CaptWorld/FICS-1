;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; interval-proper-subset?: Number Number Number Number -> Boolean
; Purpose: returns true if closed interval [start1 end1] is within
;          the closd interval [start2 end2]
(check-expect (interval-proper-subset? 4.5 5.5 2 6) #true)
(check-expect (interval-proper-subset? 4.5 5.5 4 5) #false)
(check-expect (interval-proper-subset? 4.5 5.5 5 6) #false)
(check-expect (interval-proper-subset? 4.5 5.5 4.5 6) #false)
(check-expect (interval-proper-subset? 4.5 5.5 3.5 5.5) #false)
(check-expect (interval-proper-subset? 4.5 5.5 4.5 5.5) #false)

(define (interval-proper-subset? start1 end1 start2 end2)
  (and (> start1 start2) (< end1 end2)))
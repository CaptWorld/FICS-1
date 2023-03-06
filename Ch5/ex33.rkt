;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex33) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (my-make-point x y)
  (lambda (msg)
    (cond
      [(symbol=? msg 'x) x]
      [(symbol=? msg 'y) y])))

(define (my-point-x p) (p 'x))
(define (my-point-y p) (p 'y))

(define p1 (my-make-point 3 4))
;p1 = (lambda (msg)
;       (cond
;         [(symbol=? msg 'x) 3]
;         [(symbol=? msg 'y) 4]))

(my-point-x p1)
; => (p1 'x)
; => (cond
;      [(symbol=? 'x 'x) 3]
;      [(symbol=? msg 'y) 4])
; => 3

(my-point-y p1)
; => (p1 'y)
; => (cond
;      [(symbol=? 'x 'y) 3]
;      [(symbol=? msg 'y) 4])
; => (cond
;     [(symbol=? 'y 'y) 4])
; => 4
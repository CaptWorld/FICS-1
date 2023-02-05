;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex12) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; perfect: Number -> Boolean
; purpose: checks if n is perfect number
(check-expect (perfect 6) #true)
(check-expect (perfect 28) #true)
(check-expect (perfect 496) #true)
(check-expect (perfect 8128) #true)
(check-expect (perfect 7) #false)
(check-expect (perfect 495) #false)
(check-expect (perfect 8127) #false)

(define (sum-of-divisors n to-factor)
  (cond
    [(zero? to-factor) 0]
    [(positive? to-factor) (+ (if (zero? (remainder n to-factor))
                                  to-factor
                                  0)
                              (sum-of-divisors n (sub1 to-factor)))]))

(define (perfect n)
  (= (sum-of-divisors n (sub1 n))
     n))
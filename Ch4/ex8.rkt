;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex8) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct clock (hours mins secs))
; A clock is a (make-clock h m s), where h, m and s represent
; hour, minute and second of current time


; tick: Clock -> Clock
; purpose: produces the clock struct representing the time one second
;          after the time represented by c
; Examples:
(check-expect (tick (make-clock 23 59 59)) (make-clock 0 0 0))
(check-expect (tick (make-clock 12 59 59)) (make-clock 13 0 0))
(check-expect (tick (make-clock 11 58 59)) (make-clock 11 59 0))
(check-expect (tick (make-clock 10 11 11)) (make-clock 10 11 12))
(check-error (tick 2) "function argument is not a clock structure")

(define (tick c)
  (cond
    [(not (clock? c)) (error "function argument is not a clock structure")]
    [(not (= (clock-secs c) 59)) (make-clock (clock-hours c)
                                             (clock-mins c)
                                             (add1 (clock-secs c)))]
    [(not (= (clock-mins c) 59)) (make-clock (clock-hours c)
                                             (add1 (clock-mins c))
                                             0)]
    [(not (= (clock-hours c) 23)) (make-clock (add1 (clock-hours c))
                                              0
                                              0)]
    [else (make-clock 0 0 0)]))
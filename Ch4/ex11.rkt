;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex11) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct Z ())
(define-struct S (pred))
;Data definition: a Nat is either (make-Z) or it is (make-S p), where p is a Nat.

(define (plus nat1 nat2)
  (cond
    [(Z? nat1) nat2]
    [(S? nat1) (make-S (plus (S-pred nat1) nat2))]))

; times: Nat Nat -> Nat
; purpose: computes Nat representing n * m
(check-expect (times (make-Z) (make-S (make-S (make-Z))))
              (make-Z))
(check-expect (times (make-S (make-S (make-Z)))(make-Z))
              (make-Z))
(check-expect (times (make-S (make-Z)) (make-S (make-S (make-Z))))
              (make-S (make-S (make-Z))))
(check-expect (times (make-S (make-S (make-Z))) (make-S (make-S (make-Z))))
              (make-S (make-S (make-S (make-S (make-Z))))))

; n * m = (n - 1) * m + m
(define (times n m)
  (cond
    [(Z? n) (make-Z)]
    [(S? n) (plus (times (S-pred n) m) m)]))
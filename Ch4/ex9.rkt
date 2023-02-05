;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct qfe (rat irrat base))
; Data definition: The set of numbers a + c(b ** 0.5), where is a natural number
;                  greater than 1 without repeated prime factors, and a and c are
;                  rational numbers


(define (eq-qfe-base? qfe1 qfe2)
  (= (qfe-base qfe1)
     (qfe-base qfe2)))


; add: QFE QFE -> QFE
; purpose: produces sum of sum of qfe1 and qfe2 if bases are same else throw error
(check-expect (add (make-qfe 1 -1 5) (make-qfe 1 -1 5))
              (make-qfe 2 -2 5))
(check-expect (add (make-qfe 1 -1 5) (make-qfe 1 1 5))
              (make-qfe 2 0 5))
(check-expect (add (make-qfe 1 0 5) (make-qfe 2 0 5))
              (make-qfe 3 0 5))
(check-error (add (make-qfe 1 -1 5) (make-qfe 1 -1 10))
             "bases of qfe1 and qfe2 are not the same")

(define (add qfe1 qfe2)
  (cond
    [(eq-qfe-base? qfe1 qfe2) (make-qfe (+ (qfe-rat qfe1)
                                           (qfe-rat qfe2))
                                        (+ (qfe-irrat qfe1)
                                           (qfe-irrat qfe2))
                                        (qfe-base qfe1))]
    [else (error "bases of qfe1 and qfe2 are not the same")]))


; sub: QFE QFE -> QFE
; purpose: produces subtraction of qfe2 from qfe1 if bases are same else throw error
(check-expect (sub (make-qfe 1 -1 5) (make-qfe 1 -1 5))
              (make-qfe 0 0 5))
(check-expect (sub (make-qfe 1 -1 5) (make-qfe 1 1 5))
              (make-qfe 0 -2 5))
(check-expect (sub (make-qfe 1 0 5) (make-qfe 2 0 5))
              (make-qfe -1 0 5))
(check-error (sub (make-qfe 1 -1 5) (make-qfe 1 -1 10))
             "bases of qfe1 and qfe2 are not the same")

(define (sub qfe1 qfe2)
  (add qfe1 (make-qfe (- (qfe-rat qfe2))
                      (- (qfe-irrat qfe2))
                      (qfe-base qfe2))))


; mul: QFE QFE -> QFE
; purpose: produces multiplication of qfe1 and qfe2 if bases are same else throw error
(check-expect (mul (make-qfe 1 -1 5) (make-qfe 1 -1 5))
              (make-qfe 6 -2 5))
(check-expect (mul (make-qfe 1 -1 5) (make-qfe 1 1 5))
              (make-qfe -4 0 5))
(check-expect (mul (make-qfe 1 0 5) (make-qfe 2 0 5))
              (make-qfe 2 0 5))
(check-error (mul (make-qfe 1 -1 5) (make-qfe 1 -1 10))
             "bases of qfe1 and qfe2 are not the same")

(define (mul qfe1 qfe2)
  (cond
    [(eq-qfe-base? qfe1 qfe2) (make-qfe (+ (* (qfe-rat qfe1)
                                              (qfe-rat qfe2))
                                           (* (qfe-irrat qfe1)
                                              (qfe-irrat qfe2)
                                              (qfe-base qfe1)))
                                        (+ (* (qfe-rat qfe1)
                                              (qfe-irrat qfe2))
                                           (* (qfe-rat qfe2)
                                              (qfe-irrat qfe1)))
                                        (qfe-base qfe1))]
    [else (error "bases of qfe1 and qfe2 are not the same")]))


; div: QFE QFE -> QFE
; purpose: produces division of qfe1 over qfe2 if bases are same else throw error
;          also throws error qfe2 is zero
(check-expect (div (make-qfe 1 -1 5) (make-qfe 1 -1 5))
              (make-qfe 1 0 5))
(check-expect (div (make-qfe 1 -1 5) (make-qfe 1 1 5))
              (make-qfe -1.5 0.5 5))
(check-expect (div (make-qfe 3 -2 5) (make-qfe -5 7 5))
              (make-qfe -0.25 0.05 5))
(check-expect (div (make-qfe 1 0 5) (make-qfe 2 0 5))
              (make-qfe 0.5 0 5))
(check-error (div (make-qfe 1 -1 5) (make-qfe 1 -1 10))
             "bases of qfe1 and qfe2 are not the same")
(check-error (div (make-qfe 1 -1 5) (make-qfe 0 0 10))
             "division by zero")

(define (qfe-zero? qfe)
  (and (zero? (qfe-rat qfe))
       (zero? (qfe-irrat qfe))))

; division by zero error doesn't occur here because [a * a != c * c * b]
; if they are equal, then b would have repeated prime factors but data definition of
; qfe says that b can't have repeated prime factors
(define (inverse-qfe qfe)
  (make-qfe (/ (qfe-rat qfe)
               (- (sqr (qfe-rat qfe))
                  (* (sqr (qfe-irrat qfe))
                     (qfe-base qfe))))
            (/ (- (qfe-irrat qfe))
               (- (sqr (qfe-rat qfe))
                  (* (sqr (qfe-irrat qfe))
                     (qfe-base qfe))))
            (qfe-base qfe)))
 
(define (div qfe1 qfe2)
  (cond
    [(qfe-zero? qfe2) (error "division by zero")]
    [else (mul qfe1 (inverse-qfe qfe2))]))
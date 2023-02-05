;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex10) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct point (x y))
; Data Definition: A Point is a (make-point n m), where n and m are Numbers.

; This formula seems to be the easiest -> https://math.stackexchange.com/a/1414021
(define (area-of-triangle p1 p2 p3)
  (abs (/ (- (* (- (point-x p2)
                   (point-x p1))
                (- (point-y p3)
                   (point-y p1)))
             (* (- (point-x p3)
                   (point-x p1))
                (- (point-y p2)
                   (point-y p1))))
          2)))

; in-triangle: Point Point Point Point -> Boolean
; purpose: Determines if point p lies on/within the traiangle with vertices/points
;          p1, p2 & p3
(check-expect (in-triangle (make-point 0 0)
                           (make-point 2 0)
                           (make-point 0 2)
                           (make-point 0.5 0.5))
              true)
(check-expect (in-triangle (make-point 0 0)
                           (make-point 2 0)
                           (make-point 0 2)
                           (make-point 2 2))
              false)
(check-expect (in-triangle (make-point 0 0)
                           (make-point 2 0)
                           (make-point 0 2)
                           (make-point -0.5 -0.5))
              false)
(check-expect (in-triangle (make-point 0 0)
                           (make-point 2 0)
                           (make-point 0 2)
                           (make-point 1 1))
              true)
(check-expect (in-triangle (make-point 0 0)
                           (make-point 2 0)
                           (make-point 0 2)
                           (make-point 0 2))
              true)

; Visual proof:- (Not rigorous)
; sum of area of sub-triangles formed with point p and any of the two points
; from the points p1, p2 & p3 should be equal to area of triangle formed by
; points p1, p2 & p3
(define (in-triangle p1 p2 p3 p)
  (= (area-of-triangle p1 p2 p3)
     (+ (area-of-triangle p1 p2 p)
        (area-of-triangle p1 p3 p)
        (area-of-triangle p2 p3 p))))
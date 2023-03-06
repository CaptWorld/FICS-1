;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex32) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; unfoldr: (T -> Boolean) (T -> Z) (T -> T) T -> (Listof Z)
(define (unfoldr p f g s)
  (cond
    [(p s) empty]
    [else (cons (f s) (unfoldr p f g (g s)))]))


; my-map: (T -> Z) (Listof T) -> (Listof Z)
; purpose: implement map using higher-order fn, unfoldr, defined above
(check-expect (my-map sub1 '(1 2 3))
              (map sub1 '(1 2 3)))
(check-expect (my-map number? '(1 2 3 'a "asd"))
              (map number? '(1 2 3 'a "asd")))

(define (my-map f lst)
  (unfoldr empty? (lambda (x) (f (first x))) rest lst))


; my-build-list: (Listof Nat) (Nat -> T) -> (Lisstof T)
; purpose: implement build-list using foldr
(check-expect (my-build-list 22 add1)
              (build-list 22 add1))
(check-expect (my-build-list 3 (lambda (j) (+ j 3)))
              (build-list 3 (lambda (j) (+ j 3))))
(check-expect (my-build-list 5
                             (lambda (i)
                               (build-list 5
                                           (lambda (j)
                                             (if (= i j) 1 0)))))
              (build-list 5
                          (lambda (i)
                            (build-list 5
                                        (lambda (j)
                                          (if (= i j) 1 0))))))

(define (my-build-list n f)
  (unfoldr (lambda (x) (= x n))
           f
           add1
           0))


; mult-table: Nat Nat -> (Listof (Listof Nat))
; purpose: consumes natural numbers n and m and produces a list of n lists,
;          each of length m, such that the jth entry of the ith list is
;          ij(for i,j >= 1)
(check-expect (mult-table 3 2)
              '((11 12) (21 22) (31 32)))
(check-expect (mult-table 2 3)
              '((11 12 13) (21 22 23)))
(check-expect (mult-table 2 2)
              '((11 12) (21 22)))
(check-expect (mult-table 1 1)
              '((11)))
(check-expect (mult-table 3 0)
              '(() () ()))
(check-expect (mult-table 0 3)
              empty)
(check-expect (mult-table 0 0)
              empty)

(define (mult-table n m)
  (let
      ([common-list (my-build-list m
                                   (lambda (x)
                                     (number->string (add1 x))))])
    (my-build-list n (lambda (i)
                       (my-map (lambda (j)
                                 (string->number
                                  (string-append
                                   (number->string (add1 i))
                                   j)))
                               common-list)))))
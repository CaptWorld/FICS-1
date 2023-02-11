;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex24) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/set)
; using this header to test the function, comb, properly

; comb: (Listof Any) Number -> (Listof (Listof Any))
; produces: produces a list of lists representing the n-sized subsets of lst, where the
;           elements of each subset are in the same order that they appear in lst
(check-expect (list->set (comb '(1 2 3) 4))
              (list->set empty))
(check-expect (list->set (comb '(1 2 3) 3))
              (list->set '((1 2 3))))
(check-expect (list->set (comb '(1 2 3) 2))
              (list->set '((1 2) (1 3) (2 3))))
(check-expect (list->set (comb '(1 2 3) 1))
              (list->set '((3) (1) (2))))
(check-expect (list->set (comb '(1 2 3) 0))
              (list->set '(())))
(check-expect (list->set (comb '(a 2 "def" -1.2) 3))
              (list->set '((a 2 "def") (a 2 -1.2) (a "def" -1.2) (2 "def" -1.2))))

(define (add-to-all-sub-lists x list-of-lists)
  (cond
    [(empty? list-of-lists) empty]
    [(cons? list-of-lists) (cons (cons x (first list-of-lists))
                                 (add-to-all-sub-lists x (rest list-of-lists)))]))

(define (comb lst n)
  (cond
    [(zero? n) (list empty)]
    [(empty? lst) empty]
    [(cons? lst) (append (comb (rest lst) n)
                         (add-to-all-sub-lists (first lst)
                                               (comb (rest lst) (sub1 n))))]))
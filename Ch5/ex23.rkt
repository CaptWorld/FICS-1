;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex23) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/set)
; using this header to test the function, subsets, properly

; subsets: (Listof Any) -> (Listof (Listof Any))
; produces: produces a list of lists representing the subsets of lst, where the
;           elements of each subset are in the same order that they appear in lst
(check-expect (list->set (subsets '(3 1 2)))
              (list->set '(() (3) (1) (2) (3 1) (1 2) (3 2) (3 1 2))))
(check-expect (list->set(subsets '(3 1)))
              (list->set '(() (3) (1) (3 1))))
(check-expect (list->set (subsets '(1)))
              (list->set '(() (1))))
(check-expect (list->set (subsets '()))
              (list->set '(())))
(check-expect (list->set (subsets '(a b 2)))
              (list->set '(() (a) (b) (2) (a 2) (b 2) (a b) (a b 2))))

(define (add-to-all-sub-lists x list-of-lists)
  (cond
    [(empty? list-of-lists) empty]
    [(cons? list-of-lists) (cons (cons x (first list-of-lists))
                                 (add-to-all-sub-lists x (rest list-of-lists)))]))

(define (subsets lst)
  (cond
    [(empty? lst) '(())]
    [(cons? lst) (append (subsets (rest lst))
                         (add-to-all-sub-lists (first lst) (subsets (rest lst))))]))
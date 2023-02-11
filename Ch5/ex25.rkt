;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex25) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/set)
; using this header to test the function, comb, properly

; perms: (Listof Any) -> (Listof (Listof Any))
; produces: produces a list of all permutations of a list lst of distinct values
(check-expect (list->set (perms '(1 2 3 4)))
              (list->set '((1 2 3 4) (2 1 3 4) (2 3 1 4) (2 3 4 1)
                                     (1 3 2 4) (3 1 2 4) (3 2 1 4) (3 2 4 1)
                                     (1 3 4 2) (3 1 4 2) (3 4 1 2) (3 4 2 1)
                                     (1 2 4 3) (2 1 4 3) (2 4 1 3) (2 4 3 1)
                                     (1 4 2 3) (4 1 2 3) (4 2 1 3) (4 2 3 1)
                                     (1 4 3 2) (4 1 3 2) (4 3 1 2) (4 3 2 1))))
(check-expect (list->set (perms '(1 2 3)))
              (list->set '((1 2 3) (2 1 3)
                                   (2 3 1) (1 3 2)
                                   (3 1 2) (3 2 1))))
(check-expect (list->set (perms '(1 2)))
              (list->set '((1 2)
                           (2 1))))
(check-expect (list->set (perms '(1)))
              (list->set '((1))))
(check-expect (list->set (perms '()))
              (list->set (list empty)))

(define (add-to-all-sub-lists x list-of-lists)
  (cond
    [(empty? list-of-lists) empty]
    [(cons? list-of-lists) (cons (cons x (first list-of-lists))
                                 (add-to-all-sub-lists x (rest list-of-lists)))]))

(define (add-in-all-pos x lst)
  (cond
    [(empty? lst) (list (list x))]
    [(cons? lst) (cons (cons x lst)
                       (add-to-all-sub-lists (first lst)
                                             (add-in-all-pos x (rest lst))))]))

(define (add-in-all-pos-of-sub-lists x list-of-lists)
  (cond
    [(empty? list-of-lists) empty]
    [(cons? list-of-lists) (append (add-in-all-pos x (first list-of-lists))
                                   (add-in-all-pos-of-sub-lists x
                                                                (rest list-of-lists)))]))

(define (perms lst)
  (cond
    [(empty? lst) (list empty)]
    [(cons? lst) (add-in-all-pos-of-sub-lists (first lst) (perms (rest lst)))]))
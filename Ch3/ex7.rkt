;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Substitution rule for and of BSL
; (and true exp2) => exp2
; (and false exp2) => false
; (and true exp2 exp3 ...) => (and exp2 exp3 ...)
; (and false exp2 exp3 ...) => false
; NOTE: Here, elipsis(...) means 0 or more boolean expressions & all expressions should result in
;       boolean values
; Exercise 2.33: Fill in the missing expressions to complete the following
; definitions of some basic list-manipulation operations as accumulations:

(define nil `())

; accumulate being:
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (_ accu) (+ 1 accu)) 0 sequence))

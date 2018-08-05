#|
Exercise 2.5.
Show that we can represent pairs of nonnegative
integers using only numbers and arithmetic
operations if we represent the pair a and b as
the integer that is the product 2a3b. Give the
corresponding definitions of the procedures
cons, car, and cdr.
|#
(define (count-factors p f)
  (define (count accu n)
    (if (or (= accu 0) (not (= (modulo accu f) 0)))
        n
        (count (/ accu f) (+ n 1))))
  (count p 0))
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (car z)
  (count-factors z 2))
(define (cdr z)
  (count-factors z 3))
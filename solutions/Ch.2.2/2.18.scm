; Exercise 2.18: Define a procedure reverse that takes a list as argument and
; returns a list of the same elements in reverse order:


(define (reverse l)
  (define (iter-rev tail accu)
    (if (null? tail) accu
                     (iter-rev (cdr tail) (cons (car tail) accu))))
  (iter-rev l `()))

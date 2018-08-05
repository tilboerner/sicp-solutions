; Exercise 2.10: Ben Bitdiddle, an expert systems programmer, looks over
; Alyssa’s shoulder and comments that it is not clear what it means to divide
; by an interval that spans zero. Modify Alyssa’s code to check for this
; condition and to signal an error if it occurs.

(load "solutions/Ch.2/2.07.scm")

(define (in-interval n interval)
  (and
    (<= (lower-bound interval) n)
    (>= (upper-bound interval) n)))

(define (div-interval x y)
  (if (in-interval 0 y)
    (error "Division by interval containing zero" y)
    (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y))))))

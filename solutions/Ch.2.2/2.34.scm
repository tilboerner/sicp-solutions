; Exercise 2.34: Evaluating a polynomial in x at a given value of x can be
; formulated as an accumulation. We evaluate the polynomial

; a_n * r^n + a_n−1 * r^(n−1) + ⋯ + a_1 * r + a_0

; using a well-known algorithm called Horner's rule , which structures the
; computation as

; (⋯ (a_n * r + a_n−1) * r + ⋯ + a_1) * r + a_0

; In other words, we start with a_n, multiply by x, add a_n−1, multiply by x,
; and so on, until we reach a_0.

; Fill in the following template to produce a procedure that evaluates a
; polynomial using Horner's rule. Assume that the coefficients of the
; polynomial are arranged in a sequence, from a_0 through a_n.

(load "solutions/Ch.2.2/2.33.scm")


(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                      (display (list this-coeff higher-terms))
                      (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

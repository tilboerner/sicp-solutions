;Exercise 2.1: Define a better version of make-rat that handles both positive
;and negative arguments. Make-rat should normalize the sign so that if the
;rational number is positive, both the numerator and denominator are positive,
;and if the rational number is negative, only the numerator is negative.

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (numer r) (car r))
(define (denom r) (cdr r))


;Positive-only version:

;define (make-rat n d)
;  (let ((g (gcd n d)))
;    (cons (/ n g)
;          (/ d g))))

(define (isneg? n d)
  (negative? (* n d)))

(define (make-rat n d)
  (define (isneg? n d)
    (negative? (* n d)))
  (let ((g (gcd n d))
        (neg (if (isneg? n d) -1 1)))
    (cons (* neg (abs (/ n g)))
          (abs (/ d g)))))

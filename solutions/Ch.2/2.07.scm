 ; Exercise 2.7: Alyssa's program is incomplete because she has not specified
 ; the implementation of the interval abstraction. Here is a definition of the
 ; interval constructor:

(define (make-interval a b) (cons a b))

; Rest of the program

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

; Define selectors upper-bound and lower-bound to complete the implementation.

(define (upper-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (if (> a b) a b)))

(define (lower-bound interval)
  (let ((a (car interval))
        (b (cdr interval)))
    (if (< a b) a b)))

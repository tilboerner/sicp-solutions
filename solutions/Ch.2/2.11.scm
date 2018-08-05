; Exercise 2.11: In passing, Ben also cryptically comments: "By testing the
; signs of the endpoints of the intervals, it is possible to break mul-interval
; into nine cases, only one of which requires more than two multiplications."
; Rewrite this procedure using Ben's suggestion.

(load "solutions/Ch.2/2.07.scm")

(define (sign-interval interval)
  (let ((a (lower-bound interval))
        (b (upper-bound interval)))
    (cond ((and (positive? a) (positive? b)) 1)
          ((and (negative? a) (negative? b)) -1)
          (else 0))))

(define (mymul-interval x y)
  (let ((sign-x (sign-interval x))
        (sign-y (sign-interval y))
        (x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y)))
    (cond
      ((or (= sign-x 1) (= x1 0))
        (cond ((= sign-y 1)  (make-interval (* x1 y1) (* x2 y2)))
              ((= sign-y -1) (make-interval (* x2 y1) (* x1 y2)))
              ((= sign-y 0)  (make-interval (* x2 y1) (* x2 y2)))))
      ((or (= sign-x -1) (= x2 0))
        (cond ((= sign-y 1)  (make-interval (* x1 y2) (* x2 y1)))
              ((= sign-y -1) (make-interval (* x2 y2) (* x1 y1)))
              ((= sign-y 0)  (make-interval (* x1 y2) (* x1 y1)))))
      ((= sign-x 0)
        (cond ((= sign-y 1)  (make-interval (* x1 y2) (* x2 y2)))
              ((= sign-y -1) (make-interval (* x2 y1) (* x1 y1)))
              ((= sign-y 0) (let ((p1 (* x1 y1))
                                  (p2 (* x1 y2))
                                  (p3 (* x2 y1))
                                  (p4 (* x2 y2)))
                              (make-interval (min p1 p2 p3 p4)
                                             (max p1 p2 p3 p4)))))))))

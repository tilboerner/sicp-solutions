; Exercise 2.12: Define a constructor make-center-percent that takes a center
; and a percentage tolerance and produces the desired interval. You must also
; define a selector percent that produces the percentage tolerance for a given
; interval. The center selector is the same as the one shown above.

(load "solutions/Ch.2/2.07.scm")

(define (make-center-percent center percent)
  (let ((width (abs (/ (* center percent) 100))))
    (make-interval (- center width) (+ center width))))


; percent = 100 * (width / center) with
;   (width / center)
; = (2 * width) / (2 * center)
; = (upper-bound - lower-bound) / (upper-bound + lower-bound)

(define (percent interval)
  (let ((a (lower-bound interval))
        (b (upper-bound interval)))
    (if (= a b)
      0
      (abs (* 100
              (/ (- b a) (+ a b)))))))

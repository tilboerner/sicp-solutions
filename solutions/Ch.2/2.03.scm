; Exercise 2.3. Implement a representation for rectangles in a plane.  (Hint:
; You may want to make use of Exercise 2-2.) In terms of your constructors and
; selectors, create procedures that compute the perimeter and the area of a
; given rectangle. Now implement a different representation for rectangles. Can
; you design your system with suitable abstraction barriers, so that the same
; perimeter and area procedures will work using either representation?


; from 2.2

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))


; 2.3:

(define (make-rect p1 p2)
  (cons p1 p2))
(define (width-rect r)
  (let ((p1 (car r))
        (p2 (cdr r)))
    (abs (- (x-point p2) (x-point p1)))
  ))
(define (height-rect r)
  (let ((p1 (car r))
        (p2 (cdr r)))
    (abs (- (y-point p2) (y-point p1)))
  ))

(define (area rect)
  (* (width-rect rect) (height-rect rect)))
(define (perim rect)
  (* 2
    (+ (width-rect rect) (height-rect rect))))

;(define (make-rect p1 p2)
;  (let ((base (make-point (min (x-point p1) (x-point p2))
;                          (min (y-point p1) (y-point p2))))
;        (width (abs (- (x-point p1) (x-point p2))))
;        (height (abs (- (y-point p1) (y-point p2)))))
;    (cons base (cons width height))
;  ))
;(define (width-rect r) (cadr r))
;(define (height-rect r) (cddr r))

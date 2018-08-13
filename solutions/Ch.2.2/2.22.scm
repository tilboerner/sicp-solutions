; Exercise 2.22: Louis Reasoner tries to rewrite the first square-list
; procedure of Exercise 2-21 so that it evolves an iterative process:

(define nil `())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Unfortunately, defining square-list this way produces the answer list in the
; reverse order of the one desired. Why?


; Because the answer list gets built by prepending squares to the current
; answers, so the square of the NEXT item will end up BEFORE the square of
; the current item.



; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; This doesn't work either. Explain.

; The first argument to cons is the element to prepend to the list in the
; second argument. So, if that argument is a list itself, the whole list be
; nested as the first element of the result of cons.

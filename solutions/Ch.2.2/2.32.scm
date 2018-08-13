; Exercise 2.32: We can represent a set as a list of distinct elements, and we
; can represent the set of all subsets of the set as a list of lists. For
; example, if the set is (1 2 3), then the set of all subsets is (() (3) (2) (2
; 3) (1) (1 3) (1 2) (1 2 3)). Complete the following definition of a procedure
; that generates the set of subsets of a set and give a clear explanation of
; why it works:

(define (subsets s)
  (if (null? s)
      (list `())
      (let ((elem (car s))
            (subsets-without-elem (subsets (cdr s))))
        (append subsets-without-elem
                (map (lambda (x) (cons elem x)) subsets-without-elem)))))


; It works by using these rules:

; 1. The empty set only has itself as a subset.
;    Therefore, (subsets nil) -> (list nil).

; 2. Recursion. Consider a non-empty set S. It contains at least one element,
;    let's call it e. It's also easy to see that the subsets of S come in two
;    disjoint groups: those that include e, and those that don't. There's no
;    extra subset of S that is *not* in one of these groups. Even better, there
;    is a one-to-one correspondence between the groups, because for every
;    subset without e, you can simply add e to get a subset with e,
;    and vice versa.

;    Now, if you take the element e out of S, you get another set R = S - {e}.
;    R contains all elements of S except for e, and all elements of R are also
;    in S. This means that all subsets of R are also subsets of S; in fact,
;    because R is missing only e, they are *all* the subsets of S that do not
;    contain e. The only subsets we are missing are those that *do* contain e,
;    and we can obtain them by adding e to each subset without e, which is each
;    subset of R.

;    In other words, for (R = S - {e}) and using + as the set union operator:

;    (subsets S) = (subsets R) + { X+{e} for X in (subsets R) }

; The implementation uses the first element of the backing list as e.

;    e = (car s)
;    R = (cdr s)




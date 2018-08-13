; Exercise 2.28: Write a procedure fringe that takes as argument a tree
; (represented as a list) and returns a list whose elements are all the leaves
; of the tree arranged in left-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))

; (fringe x)
; (1 2 3 4)

; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

(define (leaf? x) (not (list? x)))


(define (fringe tree)
  (cond ((not (list? tree)) (error "Need a tree in list form"))
        ((null? tree) tree)
        (else
          (let ((first (car tree)))
            (if (leaf? first) (cons first (fringe (cdr tree)))
                              (append (fringe first) (fringe (cdr tree))))))))


; http://community.schemewiki.org/?sicp-ex-2.28
; vpraid
; This is my iterative solution. It doesn't use append and it doesn't rely on
; call stack. Instead, it uses its own stack. This should work even for
; extremely large trees.

(define (fringe x)
   (define (collect stack acc)
     (if (null? stack)
         acc
         (let ((top (car stack)))
           (cond ((null? top) (collect (cdr stack) acc))
                 ((not (pair? top)) (collect (cdr stack) (cons top acc)))
                 (else (collect (cons (car top)
                                      (cons (cdr top) (cdr stack)))
                                acc))))))
   (reverse (collect (list x) nil)))

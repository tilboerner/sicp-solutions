; Exercise 2.29: A binary mobile consists of two branches, a left branch and a
; right branch. Each branch is a rod of a certain length, from which hangs
; either a weight or another binary mobile. We can represent a binary mobile
; using compound data by constructing it from two branches (for example, using
; list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with
; a structure, which may be either a number (representing a simple weight) or
; another mobile:

(define (make-branch length structure)
  (list length structure))

; Write the corresponding selectors left-branch and right-branch, which return
; the branches of a mobile, and branch-length and branch-structure, which
; return the components of a branch.

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; Using your selectors, define a procedure total-weight that returns the total
; weight of a mobile.

(define (branch-weight branch)
  (define (accu-weight branches accu)
    (if (null? branches)
      accu
      (let ((structure (branch-structure (car branches))))
        (if (not (pair? structure))
          (accu-weight (cdr branches) (+ accu structure))
          (accu-weight (cons (left-branch structure)
                             (cons (right-branch structure) (cdr branches)))
                       accu)))))
  (accu-weight (list branch) 0))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


; A mobile is said to be balanced if the torque applied by its top-left branch
; is equal to that applied by its top-right branch (that is, if the length of
; the left rod multiplied by the weight hanging from that rod is equal to the
; corresponding product for the right side) and if each of the submobiles
; hanging off its branches is balanced. Design a predicate that tests whether a
; binary mobile is balanced.

(define (balanced? mobile)
  (define (torque branch)
      (* (branch-length branch) (branch-weight branch)))
  (if (not (pair? mobile))
    #t
    (let ((left (left-branch mobile))
          (right (right-branch mobile)))
      (and (= (torque left) (torque right))
           (balanced? (branch-structure left))
           (balanced? (branch-structure right))))))

; Suppose we change the representation of mobiles so that the constructors are

    ;(define (make-mobile left right)
    ;  (cons left right))

    ;(define (make-branch length structure)
    ;  (cons length structure))

; How much do you need to change your programs to convert to the new
; representation?

; Only the selectors need to be changed: In right-branch and branch-structure,
; cadr must be replaced by cdr.


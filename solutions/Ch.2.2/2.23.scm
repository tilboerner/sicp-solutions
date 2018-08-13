 ; Exercise 2.23: The procedure for-each is similar to map. It takes as
 ; arguments a procedure and a list of elements. However, rather than forming a
 ; list of the results, for-each just applies the procedure to each of the
 ; elements in turn, from left to right. The values returned by applying the
 ; procedure to the elements are not used at all – for-each is used with
 ; procedures that perform an action, such as printing. For example,

; (for-each (lambda (x) (newline) (display x))
;           (list 57 321 88))

; should print 57, 321 and 88. The value returned by the call to for-each
; should be true. Give an implementation of for-each.


(define (for-each action items)
  (cond ((null? items) #t)
        (else
          (action (car items))
          (for-each action (cdr items))))))


; Also nice, but builds a list, and (map ...) execution order is not defined
; https://schemers.org/Documents/Standards/R5RS/HTML/r5rs-Z-H-9.html#%_idx_558
; (define (for-each action items)
;  (map action items)
;   #t
; )

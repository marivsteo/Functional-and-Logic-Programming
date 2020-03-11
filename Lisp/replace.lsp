;; 10. b) Write a function to replace the first occurence of an element E in a given list with an other element O.


;; replaceList(lst - list, e - number, o - number)
;; flow(i,i,i), output is a list
;; replaceList(l1...ln,e,o) = - nil, n = 0
;;                            - [o, l2...ln], l1 = e
;;                            - l1 U replaceList(l2...ln, e, o)
(defun replaceList (lst e o)
      (
            cond
                  ((null lst) ())
                  ((eq e (car lst)) (cons o (cdr lst)))
                  (t (cons(car lst) (replaceList (cdr lst) e o)))
      )
)
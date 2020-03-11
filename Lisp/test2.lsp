;;remElem(A - atom, lst - list)
;;remElem(a,l1...ln) = - (), n=0
;;                     - remElem(a,l2...ln), l1=a
;;                     - l1 U remElem(l2...ln), otherwise
(defun remElem (A lst)
   (cond
      ((null lst) ())
      ((EQ (car lst) A) (remElem A (cdr lst)))
      (T (cons (car lst)(remElem A (cdr lst))))
)))
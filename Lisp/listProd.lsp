;;10.
;;a) Write a function to return the product of all the numerical atoms from a list, at superficial level.


;; listProd(lst - list, x - int)
;; flow(i,o/i), output is an int
;; listProd(l1...ln, x) = - x, n = 0
;;                        - listProd(l2...ln, x*l1), l1 is number
;;                        - listProd(l2...ln, x), otherwise 
(defun listProd (lst x)
      (
            cond
                  ((null lst) x)
                  ((NUMBERP (car lst)) (setq x (* x (car lst))) (listProd (cdr lst) x))
                  (t (listProd (cdr lst) x))
      )
)

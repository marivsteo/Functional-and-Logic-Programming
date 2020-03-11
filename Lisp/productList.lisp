;;10.
;;a) Write a function to return the product of all the numerical atoms from a list, at superficial level.

(defun productList (lst x)
      (
            cond
                  ((null lst) x)
                  ((NUMBERP (car lst)) (setq x (* x (car lst))) (productList (cdr lst) x))
                  (t (productList (cdr lst) x))
      )
      
      ;; (setq x 1)

      ;; (loop while lst
      ;; do
      ;; (if (NUMBERP (car lst))
      ;;       (setq x (* x (car lst))))
      ;; (setq lst (cdr lst)))
)

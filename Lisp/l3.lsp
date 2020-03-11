;; 9. Write a function that removes all occurrences of an atom from any level of a list.
;; removeAll(element - atom, tree - list)
;; flow(i,i), output is a list
;; removeAll(e,l1...ln) = - [], e = l1
;;                         - (l1), n=1
;;                         - removeAll(l1) U removeAll(l2...ln), l1 is a list 


(defun removeAll (element tree)
  (labels ((%removeAll (element tree) ;;special form for local function binding
             (cond
               ((eql element tree) '())
               ((atom tree) (list tree))
               (t (list (mapcan (lambda (child) ;;mapcan uses nconc instead of list
                                  (%removeAll element child))
                                tree))))))
    (car (%removeAll element tree)))) ;;%removeAll always returns a list, even if the original
                                        ;;input wasn't a list, so we select the first element
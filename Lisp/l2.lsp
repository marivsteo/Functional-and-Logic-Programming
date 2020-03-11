;;9. Convert a tree of type (1) to type (2).

;;getL(lst - list, n - int)
;;getL(l1...lm,n) = - (), m = 0
;;                  - (), n = 0
;;                  - l1 U l2 U getL(l3...lm,n-1), l2 = 0
;;                  - l1 U l2 U getL(l3...lm,n), l2 = 1
;;                  - l1 U l2 U getL(l3...lm,n+1), otherwise
(defun getL (lst n)
    (cond
        ((null lst) '())
        ((equal n 0) '())
        ((equal (cadr lst) 0) (cons (car lst) (cons (cadr lst) (getL (cddr lst) (- n 1)))))
        ((equal (cadr lst) 1) (cons (car lst) (cons (cadr lst) (getL (cddr lst) n))))
        (t (cons (car lst) (cons (cadr lst) (getL (cddr lst) (+ n 1)))))
    )
)

;;takes the left subtree
;;left(lst - list)
;;left(l1...ln) = - getL(l3...ln,1)
(defun left (lst)
    (getL (cddr lst) 1)
)

;;takes the right subtree
;;right(lst - list)
;;right(l1...ln) = - ?self explanatory
(defun right (lst)
    (cddr (member (cadr (reverse (left lst))) lst))
)


;;constructs the list, but with two nils where there are zeros
;;path(lst - list)
;;path(l1...ln) = - (), n = 0
;;                - l1 U path(leftSubtree(l1...ln)) U path(rightSubtree(l1...ln)), otherwise
(defun path (lst)
    (cond
        ((null lst) '())
        (t (nconc (list (car lst)) (list (path (left lst)) (path (right lst)))))
    )
)

;;exclude(lst - list)
;;exclude(l1...ln) = - (), n=0
;;                   - exclude(l2...ln), l1 atom, l1 is nil
;;                   - l1 U exclude(l2...ln), l1 atom, l1 is not nil
;;                   - exclude(l1) U exclude(l2...ln), l1 is a list
;;eliminates nils
(defun exclude (lst)
    (cond
        ((null lst) '())
        ((atom (car lst)) (if (equal (car lst) NIL) (exclude (cdr lst)) (cons (car lst) (exclude (cdr lst)))))
        ((listp (car lst)) (cons (exclude (car lst)) (exclude (cdr lst))))
    )
)

(defvar lst '(A 2 B 0 C 2 D 0 E 1 F 1 G 1))
(write (exclude (path lst)))





;; (defun changeTree (lst x)
;;     (
;;         cond
;;             ((null lst) '())
;;             ((numberp (car lst))
;;                 (
;;                     cond 
;;                         ((eq (car lst) 0)  (list (list x) (changeTree (cdr lst) x)))
;;                         ((eq (car lst) 2) (list (list x) (changeTree(cdr lst) x)))
;;                 ))
;;             (t (changeTree (cdr lst) (car lst)))
;;     )
;; )
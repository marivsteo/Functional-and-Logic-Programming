;; (defun removeList (lst e)
;;     (
;;         cond
;;             ((null lst) ())
;;             ((and (atom (car lst)) (eq e (car lst))) (removeList (cdr lst) e))
;;             ((atom (car lst)) (cons (car lst) (removeList (cdr lst) e)))
;;             (t (mapcan #'(lambda (lst) (removeList lst e)) lst))
;;     )
;; )


;; (defun remove-all (element tree)
;;     (cond
;;         ((null tree) ())
;;         ((eql element tree) '())
;;         ((atom tree) (list tree))
;;         (t (list (mapcan (lambda (child)
;;                                   (remove-all element child))
;;                                 tree))))
;;     (car (remove-all element tree)))

;; (defun removeList (lst e)
;;       (
;;             cond
;;                   ((numberp lst) ())
;;                   ((null lst) ())
;;                   ((eq e (car lst)) (removeList (cdr lst) e))
;;                   (t (cons(car lst) (removeList (cdr lst) e)))
;;       )
;; )

;; (defun removeListFinal (lst x)
;;     (mapcar (lambda (x) (removeList lst x)))
;; )
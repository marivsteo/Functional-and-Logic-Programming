;; 10. d) Write a function to produce the list of pairs (atom n), where atom appears for n times in the
;; parameter list. Example:
;; (A B A B A C A) --> ((A 4) (B 2) (C 1)).

;; for a given nr x counts the nr of appearances in the list
;; countApp(x - int, lst - list, count - int)
;; flow(i,i,i), output is an int
;; countApp(l1...ln,x,count) = - count, n = 0
;;                             - countApp(l2...ln,x,count+1)
(defun countApp (x lst count)
      (
            cond
                  ((null lst) count)
                  ((eq x (car lst)) (setq count (+ count 1)) (countApp x (cdr lst) count))
                  (t (countApp x (cdr lst) count))
      )
)


;; constructs a list containing a number and its number of appearances
;; constructList(n - int, lst - list)
;; flow(i,i), returns a list
(defun constructList (n lst)
    (setq c (countApp n lst 0))
    (list n c)
)

;; applies constructList on all the members of the list and the result is the expected list
;; main(lst- list)
;; flow(i), modifies the list
(defun main (lst)
    (mapcar (lambda (x) (constructList x lst)) (remove-duplicates lst))
)

;; (setq x 1)
;; (setq count 0)
;; (setq lst '(1 2 3 4 5 1 1))
;; (format t "~% Number ~d appears ~d times" x (countApp x lst count))

;; (defun countList (lst reslist)
;;     (
;;         cond
;;             ((null lst) ())
;;             (t (setq a (countApp (car lst) lst 0)) (countListAux a nil ) (countList (cdr lst)))
;;     )
;; )

;; (defun countListAux (L A)
;;     (if (null L)
;;         A
;;         (countListAux (rest L) (cons (first L) A))
;;     )
;; )


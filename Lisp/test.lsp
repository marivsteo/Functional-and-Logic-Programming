;;removeConsecutive(lst list, n int)
;;removeConsecutive(l1...ln,m) = - (), n=0
;;                               - l1 U removeC(l2...ln,m), l1 not number
;;                               - removeC(l3...ln,l2), l1,l2 consecutive
;;                               - l1 U l2 U removeC(l3...ln,l2), l1,l2 not consec
(defun removeConsecutive (lst n)
    (cond
        ((and (numberp (car lst)) (numberp n) (equal n (- (car lst) 1)) (removeConsecutive (cdr lst) (car lst))))
        ((and (numberp (car lst)) (numberp n)) (cons n (cons (car lst) (removeConsecutive (cdr lst) (car lst))))) 
        (t (cons (car lst) (removeConsecutive (cdr lst) n))) 
    )
)


(defun main (lst)
    (removeConsecutive (cdr lst) (car lst))
)

;;removeConsecutive(lst list)
;;removeConsecutive(l1...ln) =  - (), n=0
;;                              - l1 U removeC(l2...ln), l1 not number
;;                              - removeC(l3...ln), l1,l2 consecutive
;;                              - l1 U l2 U removeC(l3...ln), l1,l2 not consec
;;       
(defun removeConsecutive2 (lst)
    (cond
        ((and (numberp (car lst)) (numberp (cadr lst)) (eq (car lst) (- (cadr lst) 1)) (removeConsecutive2 (cddr lst))))
        ((and (numberp (car lst)) (numberp (cadr lst))) (cons (car lst) (cons (cadr lst) (removeConsecutive2 (cddr lst))))) 
        (t (cons (car lst) (removeConsecutive2 (cdr lst)))) 
    )
)
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


;; 10. c) Write a function to compute the result of an arithmetic expression memorised
;;  in preorder on a stack. Examples:
;;  (+ 1 3) ==> 4 (1 + 3)
;;  (+ * 2 4 3) ==> 11 [((2 * 4) + 3)
;;  (+ * 2 4 - 5 * 2 2) ==> 9 ((2 * 4) + (5 - (2 * 2))


;; evalsimple(op - char, op1 - int, op2 - int)
;; flow(i, i, i)
;; evalsimple(op op1 op2) =   - op1 + op2, op1,op2 numbers, op = +
;;                            - op1 - op2, - || - , op = -
;;                            - op1 * op2, - || - , op = *
;;                            - op1 / op2, - || - , op = /
(defun evalsimple (op op1 op2)
    (
        cond
            ((numberp op1) (numberp op2)
                (
                    cond
                        ((equal op '+) (+ op1 op2))
                        ((equal op '-) (- op1 op2))
                        ((equal op '/) (/ op1 op2))
                        ((equal op '*) (* op1 op2))
                )
            )
    )
)

(setq operators (list '+ '- '/ '*))


;; evaluateagain(expr - list)
;; flow(i), output is a list
;; evaluateagain(l1...ln) = - [], n = 0
;;                          - evalsimple(l1,l2,l3) U evaluateagain(l4...ln), l1 operator, l2, l3 numbers
;;                          - l1 U evaluateagain(l2...ln), otherwise
(defun evaluateagain (expr)
    (
        cond
            ((null expr) expr)
            ((and (member (car expr) operators) (numberp (cadr expr)) (numberp (caddr expr))) (cons (evalsimple (car expr) (cadr expr) (caddr expr)) (evaluateAgain (cdddr expr))))
            (t (cons (car expr) (evaluateAgain (cdr expr))))
    )
)


;; evaluate(expr - list)
;; flow(i), output is an int
;; evaluate(l1...ln) = - l1, n = 1
;;                     - 0, n = 0
;;                     - evaluate(evaluateagain(expr)), otherwise 
(defun evaluate (expr)
    (if (= (list-length expr) 1)
        (car expr)
        (evaluate (evaluateagain expr))
    )
)


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
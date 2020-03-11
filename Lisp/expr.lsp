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
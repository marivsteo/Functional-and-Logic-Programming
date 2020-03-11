(DEFUN main (L) (CAR (fun L)))

(DEFUN fun (e)
    (COND
        ((AND (NUMBERP e) (EQUAL (mod e 3) 0)) NIL)
        ((ATOM e) (LIST e))
        (T (LIST (MAPCAN #'fun e)))
    )
)
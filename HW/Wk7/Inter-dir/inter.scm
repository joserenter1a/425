(define sample '(mul (add 2 2) (add 3 3)))

(define (interpret expr)
  (cond ((number? expr) expr)
        (else (let ((left (interpret (cadr expr)))
                    (right (interpret (caddr expr))))
                (cond ((eq? 'add (car expr)) (+ left right))
                      ((eq? 'sub (car expr)) (- left right))
                      ((eq? 'mul (car expr)) (* left right))
                      ((eq? 'div (car expr)) (/ left right))
                      (else "malformed"))))))

(define (test2)
  (interpret sample))

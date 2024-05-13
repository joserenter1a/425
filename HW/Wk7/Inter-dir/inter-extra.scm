; Extend the interpreter "interpret.scm" with two new operations, max
; and min with the obvious value, e.g., (max x y) returns the maximum
; of x and y

(define sample '(mul (add 2 (max 2 0)) (add 3 3)))

(define table (list (cons 'add +) (cons 'mul *)
                    (cons 'max (lambda (x y) (if (<= x y) y x)))))

(define (lookup key table)
  (cond ((null? table) "not found")
        ((eq? key (caar table)) (cdar table))
        (else (lookup key (cdr table)))))

(define (interpret expr)
  (cond ((number? expr) expr)
        (else (let ((left (interpret (cadr expr)))
                    (right (interpret (caddr expr))))
                ((lookup (car expr) table) left right)))))

(define (test2)
  (interpret sample))

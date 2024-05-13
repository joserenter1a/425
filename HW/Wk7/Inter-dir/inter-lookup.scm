
(define sample '(mul (add 2 2) (add 3 3)))

(define table (list (cons 'add +) (cons 'mul *)))

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

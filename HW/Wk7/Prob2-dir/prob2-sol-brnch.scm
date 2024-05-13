(define sample '(7 () (9 () ())))

(define addall
  (lambda (t)
    (if (null? t) 0
        (+ (car t) (addall (cadr t)) (addall (caddr t))))))

(define test (equal? (addall sample) 16))

test


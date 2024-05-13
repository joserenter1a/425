(define sample '(7 (9 5)))

(define addall
  (lambda (t)
    (if (list? t) (+ (addall (car t)) (addall (cadr t)))
        t)))

(define test (equal? (addall sample) 21))

test


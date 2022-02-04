#lang racket
(provide (all-defined-out))

(define (merge_envs E1 E2)
  (define (check x y) ; check if the variable is in both environments
           (cond [(null? y)#f]
                 [(null? x)#f]
                 [(eq? x (car (car y)))#t]
                 [else(check x (cdr y))]))
  (cond [(null? E1)E2]
        [(null? E2)E1]
        [(check (car(car E1)) E2)(merge_envs (cdr E1)E2)] ; if the variable exists in both environments pick the second one
        [else(merge_envs (cdr E1)(cons(car E1)E2))]) ; else take the variable and create a new list
  )



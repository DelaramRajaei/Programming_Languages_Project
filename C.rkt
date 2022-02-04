#lang racket
(provide (all-defined-out))

(struct rule (left_nonterminal terminal right_nonterminal) #:transparent)

(define (is_derived gr s) ;; TODO implement this function
  (define lst(map string (string->list s)))
  (define (find_rule y x gr)
    (cond [(null? gr)'()]
          [(and (equal? y (rule-left_nonterminal(first gr)))(equal? x (rule-terminal(first gr))))
          (rule-right_nonterminal(first gr))]
          [else (find_rule y x (remove (first gr) gr))])
    )
  (define (check_termination string lst gr)
    (set! string (find_rule string (first lst) gr))
    (cond [(empty? string) #f]
          [else(check string (remove (first lst) lst) gr)])
    )
  (define (check string lst gr)
    (cond [(empty? lst)#t]
    [else(check_termination string lst gr)]))
  (check "S" lst gr) 
  )
 
#lang racket
(provide (all-defined-out))

(define (get_MSS ls)
  (define (calculate_max ls current_sum best_sum)
    (cond [(null? ls)best_sum]
          [else (let ((new_max (max 0 (+ (car ls) current_sum))))
          (calculate_max (cdr ls) new_max (max new_max best_sum)))]))
  (calculate_max ls 0 0)
  )

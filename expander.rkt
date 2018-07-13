#lang racket
(provide (except-out (all-from-out racket) #%module-begin #%top-interaction))

(define-syntax (the-md-begin stx)
  (syntax-case stx ()
    [(mb decl ...)
     #'(#%module-begin decl ...)]))
(provide (rename-out [the-md-begin #%module-begin]))

(define-syntax (the-top-interaction stx)
  ;;  (printf "Testing top-interaction with expression: ~a\n" (syntax->datum stx))
  ;;  #`(#%top-interaction . #,(cdr (syntax-e stx))))
  (syntax-case stx ()
    [(ti . d) #'(integer->char d)]))
(provide (rename-out [the-top-interaction #%top-interaction]))

(define (digits-func . chars)
  (string->number
   (apply string-append chars)))

(define-syntax (digits stx)
  (syntax-case stx ()
    [(_ char ...)
     #'(digits-func char ...)]))
(provide digits)

(define (int-seq-func . digits-list)
  (void
   (for/list ([digits digits-list])
     (display (integer->char digits)))
   (newline)))

(define-syntax (int-seq stx)
  (syntax-case stx ()
    [(_ digits ...) #'(int-seq-func digits ...)]))
(provide int-seq)

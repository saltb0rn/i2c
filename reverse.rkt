#lang racket
(require syntax/strip-context)
(provide (except-out (all-from-out racket)
		     #%module-begin #%top-interaction))
(define (read-syntax path port)
  (define strsrc (string-trim (port->string port)))
  (define charlst (string->list strsrc))
  (define intlst (map char->integer charlst))
  (strip-context
   #`(module i2c-reverse-mod i2c/reverse
       #,@intlst)))

;; I have no idea, in the input like '[Hello]', how to have '[' and ']' translated
;; '[' and ']' will always be translated into '(' and ')', then the integers are 40 and 41.

(begin-for-syntax
 (define (string->int-seq str)
   (define c-list (string->list str))
   (map char->integer c-list)))

(define-syntax (the-top-interaction stx)
  (syntax-case stx ()
    [(ti . d) #`'#,(string->int-seq (format "~a" (syntax->datum #'d)))]))
(provide (rename-out [the-top-interaction #%top-interaction]))

(module+ reader
  (provide read-syntax))

(provide #%module-begin)

#lang racket
(require syntax/strip-context)
(provide (except-out (all-from-out racket) #%module-begin))
(define (read-syntax path port)
  (define strsrc (string-trim (port->string port)))
  (define charlst (string->list strsrc))
  (define intlst (map char->integer charlst))
  (strip-context
   #`(module i2c-reverse-mod i2c/reverse #,@intlst)))

(module+ reader
  (provide read-syntax))

(provide #%module-begin)

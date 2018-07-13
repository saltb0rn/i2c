#lang racket
(require i2c/parser)
(require syntax/strip-context)
(define (read-syntax path port)
  (with-syntax ([parse-tree (parse-to-datum (port->string port))])
    (strip-context
     #'(module i2c-mod i2c/expander
	 parse-tree))))
(provide read-syntax)

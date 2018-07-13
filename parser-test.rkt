#lang br

(require "parser.rkt")
(parse-to-datum "23 45 23 124\n 145 \n24")

;(define intlst
;  (list 76 105 103 104 116 82 111 98
;	111 116 32 83 116 117 100 105
;	111 115 32 105 115 32 98 111
;	1114 110 32 116 111 100 97 121
;	32 33 32))

;(display "\n")
;(define (display-seq lst)
;  (if (null? lst)
;      (displayln)
;      (begin
;	(display (integer->char (car lst)))
;	(display-seq (cdr lst)))))

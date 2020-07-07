#lang racket/base

(require racket/list)
(require pollen/tag)
(require pollen/decode)
(require txexpr)

(provide (all-defined-out))

(define (root . elements)
  (txexpr 'root empty (decode-elements elements
                       #:txexpr-elements-proc decode-paragraphs)))

(define head (default-tag-function 'div #:id "head"))
(define title (default-tag-function 'h1 #:id "title"))
(define lead (default-tag-function 'p #:class "lead"))
(define time (default-tag-function 'p #:class "time"))
(define-tag-function (link attrs elems)
  `(a ((href ,(string-append "http://" (first elems))) (class "link")) ,@elems) )


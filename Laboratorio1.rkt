#lang racket

;Contructor
;Dominio: Entero x entero x [pixbit-d* | pixrgb-d* | pixhex-d*]
;Recorrido: imagen

(define imagen (lambda (width height pixbit-d pixrgb-d pixhex-d)
                (cond
                  [(integer? width)] [(integer? height)])
                (list width height pixbit-d pixrgb-d pixhex-d)))

;constructor
(define pixbit-d (lambda (x y bit depth)
                   (cond
                     [(integer? x)] [(integer? y)] [(or (= bit 0) (= bit 1))] [(integer? depth)])
                   (list x y bit depth)))

;contructor
(define pixrgb-d (lambda (x y r g b d)
                   (cond
                     [(integer? x)] [(integer? y)] [(integer? r) (>= r 0) (<= r 255)] [(integer? g) (>= g 0) (<= g 255)] [(integer? b) (>= b 0) (<= b 255)] [(integer? d)])
                   (list x y r g b d)))

;Constructor
(define pixhex-d (lambda (x y hex d)
                   (cond
                     [(integer? x)] [(integer? y)] [(string? hex)] [(integer? d)])
                   (list x y hex d)))

;Selectores

(define get-width car)

(define get-height cadr)

(define get-pixbit-d caddr)

(define get-pixrgb-d cadddr)

(define get-pixhex-d (lambda (p) (list-ref p 4)))


;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;contructor
(define bitmap? (lambda (p pixbit-d)
                  (imagen (get-width p)
                          (get-height p)
                          (get-pixbit-d p)
                          pixbit-d
                          pixbit-d)))

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;contructor
(define pixmap? (lambda (p pixbit-d)
                  (imagen (get-width p) (get-height p)
                          (get-pixbit-d p)
                          (cond [(bitmap? get-pixbit-d)])
                          (get-pixrgb-d p)
                          (cond [(bitmap? get-pixrgb-d)])
                          (get-pixhex-d p)
                          (cond [(bitmap? get-pixhex-d)]))))

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


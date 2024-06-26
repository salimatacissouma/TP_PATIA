(define (problem graph-2) (:domain graph)
(:objects 
n1 n2 n3 n4 n5 - node
c1 c2 c3 - color
)
;; Les couleurs c1,c2 et c3 sont différentes.
;; n1-n3, n2-n3, n3-n4, n3-n5 et n4-n5  sont des arcs.
;; n1, n2, n3, n4 et n5 sont incolores.
(:init
    (not_same_color c1 c2)
    (not_same_color c2 c1)
    (not_same_color c2 c3)
    (not_same_color c3 c2)
    (not_same_color c1 c3)
    (not_same_color c3 c1)
    (near n1 n3)
    (near n3 n1)
    (near n2 n3)
    (near n3 n2)
    (near n3 n4)
    (near n4 n3)
    (near n3 n5)
    (near n5 n3)
    (near n4 n5)
    (near n5 n4)
    (colorless n1)
    (colorless n2)
    (colorless n3)
    (colorless n4)
    (colorless n5)
)
;; Le but c'est d'avoir tous les arcs colorés.
(:goal (and
    (nodes_colored n1 n3)
    (nodes_colored n2 n3)
    (nodes_colored n3 n4)
    (nodes_colored n3 n5)
    (nodes_colored n4 n5)
))
)

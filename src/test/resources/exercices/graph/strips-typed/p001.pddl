(define (problem graph-1) (:domain graph)
(:objects 
n1 n2 n3 n4 - node
c1 c2 c3 - color
)

(:init
    (not_same_color c1 c2)
    (not_same_color c2 c1)
    (not_same_color c2 c3)
    (not_same_color c3 c2)
    (not_same_color c1 c3)
    (not_same_color c3 c1)
    (near n1 n2)
    (near n2 n1)
    (near n1 n3)
    (near n3 n1)
    (near n2 n3)
    (near n3 n2)
    (near n3 n4)
    (near n4 n3)
    (colorless n1)
    (colorless n2)
    (colorless n3)
    (colorless n4)
)

(:goal (and
    (nodes_colored n1 n2)
    (nodes_colored n1 n3)
    (nodes_colored n2 n3)
    (nodes_colored n3 n4)
))
)

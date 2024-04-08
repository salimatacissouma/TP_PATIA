(define (problem test-pursuit1) (:domain poursuit_evasion)
(:objects 
    n1 n2 n3 n4 n5 - node
    a1 a2  - agent
)

(:init
    (not_same_node n1 n2)
    (not_same_node n1 n3)
    (not_same_node n1 n4)
    (not_same_node n1 n5)

    (not_same_node n2 n1)
    (not_same_node n2 n3)
    (not_same_node n2 n4)
    (not_same_node n2 n5)

    (not_same_node n3 n1)
    (not_same_node n3 n2)
    (not_same_node n3 n4)
    (not_same_node n3 n5)

    (not_same_node n4 n1)
    (not_same_node n4 n2)
    (not_same_node n4 n3)
    (not_same_node n4 n5)

    (not_same_node n5 n1)
    (not_same_node n5 n2)
    (not_same_node n5 n3)
    (not_same_node n5 n4)

    (not_same_agent a1 a2)
    (not_same_agent a2 a1)

    (free n2)
    (free n3)
    (free n4)
    (free n5)
    (near n1 n2)
    (near n2 n1)
    (near n2 n3)
    (near n3 n2)
    (near n4 n2)
    (near n2 n4)
    (near n2 n5)
    (near n5 n2)
    (near n4 n5)
    (near n5 n4)
    (agents_on_node a1 a2 n1)
)

(:goal (and
    (visited n1)
    (visited n2)
    (visited n3)
    (visited n4)
    (visited n5)

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

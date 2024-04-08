;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; graph_coloring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;

;Header and description

(define (domain graph)

;remove requirements that are not needed
(:requirements :strips :typing)

(:types node color
)


(:predicates (colored ?x - node ?y - color)
	       (near ?x - node ?y - node)
           (not_same_color ?x - color ?y - color)
           (clear ?x - node)
           (nodes_colored ?x - node ?y - node)
	       (colorless ?x - node)
           (node_colored_with ?x - node ?y - color)
)


(:action colored_2_nodes
    :parameters (?x - node ?y - node ?c1 - color ?c2 - color)
    :precondition (and (near ?x ?y) (colorless ?x) (colorless ?y) (not_same_color ?c1 ?c2))
    :effect (and(colored ?x ?c1)
                (colored ?y ?c2)
                (node_colored_with ?x ?c1)
                (node_colored_with ?y ?c2)
                (not (colorless ?x))
                (not (colorless ?y))
                )
)

(:action colored_1_node
    :parameters (?x - node ?y - node ?c1 - color ?c2 - color)
    :precondition (and (near ?x ?y) (node_colored_with ?x ?c1) (colorless ?y)
     (not_same_color ?c1 ?c2))
    :effect (and
                (colored ?y ?c2)
                (node_colored_with ?y ?c2)
                (not (colorless ?y))
)
)
(:action change_color
    :parameters (?x - node ?y - node ?c1 - color ?c2 - color)
    :precondition (and (near ?x ?y) (node_colored_with ?x ?c1) (node_colored_with ?y ?c1) 
    (not_same_color ?c1 ?c2))
    :effect (and(clear ?y) (colorless ?y))
)


(:action marking_bow
    :parameters (?x - node ?y - node ?c1 - color ?c2 - color)
    :precondition (and (near ?x ?y) (node_colored_with ?x ?c1) (node_colored_with ?y ?c2) 
    (not_same_color ?c1 ?c2))
    :effect (and(nodes_colored ?x ?y))
)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; graph_coloring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;

(define (domain graph)

(:requirements :strips :typing)

(:types node color
)


(:predicates (colored ?x - node ?y - color); Prédicat pour indiquer qu'un nœud est coloré.
	       (near ?x - node ?y - node); Prédicat pour indiquer que deux nœuds sont proches l'un de l'autre, c'est-à-dire reliés par un arc.
           (not_same_color ?x - color ?y - color);Prédicat pour indiquer que deux couleurs sont différentes.
           (clear ?x - node);Prédicat pour indiquer qu'un nœud est nétoyé (non coloré).
           (nodes_colored ?x - node ?y - node);Prédicat pour indiquer que deux nœuds sont colorés.
	       (colorless ?x - node);Prédicat pour indiquer qu'un nœud est sans couleur.
           (node_colored_with ?x - node ?y - color); rédicat pour indiquer quelle couleur est utilisée pour colorer un nœud.
)

  ;; Action: colorer deux nœuds.
  ;; La précondition: les deux nœuds doivent être liés et incolores,les couleurs prises en paramètre doivent être différentes
  ;; L'effet: les deux nœuds sont colorés avec des couleurs différentes.
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

  ;; Action: colorer un nœud sur un arc avec un seul nœud incolore.
  ;; La précondition: les deux nœuds doivent être liés,les couleurs prises en paramètre doivent 
  ;être différentes et l'un des nœuds doit être coloré avec l'une des couleurs.
  ;; L'effet: les deux nœuds sont colorés avec des couleurs différentes.
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
  ;; Action: décolorer un nœud sur un arc avec les nœuds colorés de la même couleur.
  ;; La précondition: les deux nœuds doivent être liés, colorés par la même couleur.
  ;; L'effet: l'un des deux nœuds devient incolore.
(:action clear_color
    :parameters (?x - node ?y - node ?c1 - color)
    :precondition (and (near ?x ?y) (node_colored_with ?x ?c1) (node_colored_with ?y ?c1))
    :effect (and(clear ?y) (colorless ?y))
)

  ;; Action: marquer un arc.
  ;; La précondition: les deux nœuds doivent être:
  ;- liés, 
  ;- colorés avec des couleurs différentes.
  ;; L'effet: les deux nœuds sont colorés. Ça évitera de repasser sur cet arc.
(:action marking_bow
    :parameters (?x - node ?y - node ?c1 - color ?c2 - color)
    :precondition (and (near ?x ?y) (node_colored_with ?x ?c1) (node_colored_with ?y ?c2) 
    (not_same_color ?c1 ?c2))
    :effect (and(nodes_colored ?x ?y))
)
)

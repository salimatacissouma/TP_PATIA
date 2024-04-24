;Header and description

(define (domain poursuit_evasion)

;remove requirements that are not needed
(:requirements :strips :typing)

(:types node agent
)

(:predicates (agent_on_node ?x - agent ?y - node);Prédicat pour indiquer qu'un agent est sur un nœud donné.
            (agents_on_node ?x - agent ?y - agent ?z - node); Prédicat pour indiquer que deux agents sont sur un même nœud.
            (near ?x - node ?y - node);Prédicat pour indiquer que deux nœuds sont proches l'un de l'autre.
            (not_same_agent ?x - agent ?y - agent); Prédicat pour indiquer que deux agents sont différents.
            (not_same_node ?x - node ?y - node); Prédicat pour indiquer que deux nœuds sont différents.
            (free ?x - node); Prédicat pour indiquer qu'un nœud est libre, c'est-à-dire non occupé par un agent.
            (visited ?x - node); Prédicat pour indiquer qu'un nœud a été visité par un agent.
)
  ;; Action: déplacer un agent d'un nœud occupé par deux agents vers un nœud libre.
  ;; La précondition: les deux agents doivent être sur le même nœud, et le nœud cible doit être libre et proche.
  ;; L'effet: les deux agents sont sur des nœuds différents mais proche.
(:action move_agent1
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node )
    :precondition (and (agents_on_node ?a1 ?a2 ?current) (near ?current ?next) (not_same_node ?current ?next)
                    (free ?next) (not_same_agent ?a1 ?a2))
    :effect (and (agent_on_node ?a1 ?next) (agent_on_node ?a2 ?current) (not (agents_on_node ?a1 ?a2 ?current))
            (not(free ?current))(not(free ?next)))
)

  ;; Action: déplacer un agent vers un nœud déjà occupé par un autre.
  ;; La précondition: les deux agents doivent être sur des nœuds différent mais proche.
  ;; L'effet: les deux agents sont sur le même nœud.
(:action move_agent2
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node)
    :precondition (and (agent_on_node ?a1 ?current) (agent_on_node ?a2 ?next) (near ?current ?next)
                    (not_same_node ?current ?next) (not_same_agent ?a1 ?a2))
    :effect (and (agents_on_node ?a1 ?a2 ?next) (not( agent_on_node ?a1 ?current))
            (free ?current) (not(free ?next)))
)

  ;; Action: déplacer un agent d'un nœud q'il occupe seul vers 
   ;un nœud libre en s'assurant qu'il y'ait un autre agent sur l'autre nœud qui est lié à celui qu'il va 
   ;libérer. c'est à dire le nœud qui sera libre est lié à au moins deux autres nœuds
  ;; La précondition:
   ;-les deux nœuds occupés sont proches
   ;-le nœud d'arrivé est libre et proche du nœud de départ
   ;-l'autre nœud voisin de celui de départ est déjà visité
  ;; L'effet:l'agent se trouve sur le nœud d'arrivé et celui de départ est marqué comme visité.
(:action move_agent3
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node ?preview - node)
    :precondition (and (agent_on_node ?a1 ?current) (agent_on_node ?a2 ?preview) (near ?preview ?current) (near ?current ?next) 
     (not_same_node ?next ?preview) (not_same_node ?current ?preview) (not_same_agent ?a1 ?a2) (not_same_node ?current ?next)
     (free ?next) (visited ?preview))
    :effect (and (agent_on_node ?a1 ?next) (not (agent_on_node ?a1 ?current)) (free ?current) (not (free ?preview))
                (not(free ?next)) (agent_on_node ?a2 ?preview) ( visited ?current))
)

  ;; Action: marquer qu'un nœud est visité.
  ;; La précondition: les deux agents doivent être sur le même nœud
  ;; L'effet: le nœud est marqué comme visité.
(:action mark_visited
    :parameters (?a1 - agent ?a2 - agent ?n - node)
    :precondition (and (agents_on_node ?a1 ?a2 ?n))
    :effect (and( visited ?n))
)

)
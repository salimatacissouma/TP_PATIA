;Header and description

(define (domain poursuit_evasion)

;remove requirements that are not needed
(:requirements :strips :typing)

(:types node agent
)

; un-comment following line if constants are needed
;(:constants )

(:predicates (agent_on_node ?x - agent ?y - node)
            (agents_on_node ?x - agent ?y - agent ?z - node)
	       (near ?x - node ?y - node)
           (not_same_agent ?x - agent ?y - agent)
           (not_same_node ?x - node ?y - node)
           (free ?x - node)
           (visited ?x - node)
)


; (:action move_agent1
;     :parameters (?a1 - agent ?current - node ?next - node)
;     :precondition (and (agent_on_node ?a1 ?current) (near ?current ?next) 
;       (not_same_node ?current ?next) (free ?next) )
;     :effect (and (agent_on_node ?a1 ?next) (not (agent_on_node ?a1 ?current)) (free ?current)
;                 (not(free ?next)) ( visited ?current)))

(:action move_agent4
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node ?preview - node)
    :precondition (and (agent_on_node ?a1 ?current) (agent_on_node ?a2 ?preview) (near ?preview ?current) (near ?current ?next) 
     (not_same_node ?next ?preview) (not_same_node ?current ?preview) (not_same_agent ?a1 ?a2) (not_same_node ?current ?next)
     (free ?next) (visited ?preview))
    :effect (and (agent_on_node ?a1 ?next) (not (agent_on_node ?a1 ?current)) (free ?current) (not (free ?preview))
                (not(free ?next)) (agent_on_node ?a2 ?preview) ( visited ?current))
)

(:action move_agent2
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node )
    :precondition (and (agents_on_node ?a1 ?a2 ?current) (near ?current ?next) (not_same_node ?current ?next)
                    (free ?next) (not_same_agent ?a1 ?a2))
    :effect (and (agent_on_node ?a1 ?next) (agent_on_node ?a2 ?current) (not (agents_on_node ?a1 ?a2 ?current))
            (not(free ?current))(not(free ?next)))
)

(:action move_agent3
    :parameters (?a1 - agent ?a2 - agent ?current - node ?next - node)
    :precondition (and (agent_on_node ?a1 ?current) (agent_on_node ?a2 ?next) (near ?current ?next)
                    (not_same_node ?current ?next) (not_same_agent ?a1 ?a2))
    :effect (and (agents_on_node ?a1 ?a2 ?next) (not( agent_on_node ?a1 ?current)) (not(agent_on_node ?a2 ?next))
            (free ?current) (not(free ?next)))
)

(:action mark_visited
    :parameters (?a1 - agent ?a2 - agent ?n - node)
    :precondition (and (agents_on_node ?a1 ?a2 ?n))
    :effect (and( visited ?n))
)


 ;todo: define numeric functions here

;define actions here

)
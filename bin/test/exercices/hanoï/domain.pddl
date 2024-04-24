;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hanoï
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Header and description

(define (domain hanoï)

;remove requirements that are not needed
(:requirements :strips :typing )

(:types disk stack
)



(:predicates (on ?x - disk ?y - disk)
	       (onstack ?x - disk ?y - stack)
	       (clear ?x - disk)
	       (handempty)
	       (holding ?x - disk)
           (smaller ?x - disk)
)

(:action pick-up
    :parameters (?x - disk ?y - stack)
    :precondition (and (clear ?x) (onstack ?x ?y) (handempty))
    :effect (and (not (onstack ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (onstack ?x ?y))

 ;todo: define numeric functions here
)

;define actions here

)
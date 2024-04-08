(define (domain sokoban)

  ; remove requirements that are not needed
(:requirements :strips :typing :disjunctive-preconditions)

  (:types agent case box
  )

  ; un-comment following line if constants are needed
  ; (:constants )

  (:predicates
    (on ?x - agent ?y - case)
    (box_on ?x - box ?y - case)
    (has_target ?x - case)
    (free ?x - case)
    (adjacent ?x - case ?y - case)
    (horizontal_adjacent ?x - case ?y - case) 
    (vertical_adjacent ?x - case ?y - case)
    ; (adjacent_box ?x - box ?y - case)
    (box_on_final_case ?x - box ?y - case)
    (not_same ?x - case ?y - case)

  )

  ; define actions here
  (:action move
    :parameters (?a - agent ?x - case ?y - case)
    :precondition (and (on ?a ?x) (adjacent ?x ?y) (free ?y)) 
    :effect (and (on ?a ?y) (free ?x) (not (on ?a ?x)) (not (free ?y)))
  )

  (:action go_to_horizontal
    :parameters (?a - agent ?from_a - case ?from_b - case ?box - box ?target - case)
    :precondition (and (on ?a ?from_a) (box_on ?box ?from_b) (horizontal_adjacent ?from_a ?from_b)(free ?target)
     (horizontal_adjacent ?from_b ?target) (not_same ?from_a ?from_b) (not_same ?from_b ?target) 
      (not_same ?from_a ?target))
    :effect (and (on ?a ?from_b)(box_on ?box ?target) (not (on ?a ?from_a)) (not(box_on ?box ?from_b))
    (free ?from_a) (not (free ?target)))
  )

  (:action go_to_vertical
    :parameters (?a - agent ?from_a - case ?from_b - case ?box - box ?target - case)
    :precondition (and (on ?a ?from_a) (box_on ?box ?from_b) (vertical_adjacent ?from_a ?from_b)
    (free ?target) (vertical_adjacent ?from_b ?target) (not_same ?from_a ?from_b) (not_same ?from_b ?target) 
      (not_same ?from_a ?target))
    :effect (and (on ?a ?from_b)(box_on ?box ?target) (not (on ?a ?from_a)) (not(box_on ?box ?from_b))
    (free ?from_a) (not (free ?target)))
  )
   
  (:action place_box_final
  :parameters (?box - box ?final_case - case)
  :precondition (and (box_on ?box ?final_case) (has_target ?final_case))
  :effect (box_on_final_case ?box ?final_case)
 )

)

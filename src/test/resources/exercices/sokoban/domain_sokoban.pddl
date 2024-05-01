;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; sokoban
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (domain sokoban)

(:requirements :strips :typing)

  (:types agent case box)


  (:predicates
      (on ?x - agent ?y - case) ; Prédicat pour indiquer qu'un agent est sur une case.
      (box_on ?x - box ?y - case) ; Prédicat pour indiquer qu'une boîte est sur une case.
      (has_target ?x - case) ; Prédicat pour indiquer qu'une case est une cible.
      (free ?x - case) ; Prédicat pour indiquer qu'une case est libre.
      (adjacent ?x - case ?y - case) ; Prédicat pour indiquer que deux cases sont adjacentes.
      (horizontal_adjacent ?x - case ?y - case) ; Prédicat pour indiquer que deux cases sont horizontalement adjacentes.
      (vertical_adjacent ?x - case ?y - case) ; Prédicat pour indiquer que deux cases sont verticalement adjacentes.
      (box_on_final_case ?x - box ?y - case) ; Prédicat pour indiquer qu'une boîte est sur la case finale.
      (not_same ?x - case ?y - case) ; Prédicat pour indiquer que deux cases sont différentes.
  )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Dans notre concept l'agent peut se deplacer dans toutes les directions et il ne peut pas
  ;; partager de case avec une boite.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Action: déplacer un agent entre deux cases adjacentes.
  ;; La précondition: l'agent se trouve sur la case départ qui est adjacente à la case d'arrivé.
  ;; L'effet: l'agent se trouve sur la case d'arrivé.
  (:action move
    :parameters (?a - agent ?x - case ?y - case)
    :precondition (and (on ?a ?x) (adjacent ?x ?y) (free ?y)) 
    :effect (and (on ?a ?y) (free ?x) (not (on ?a ?x)) (not (free ?y)))
  )

  ;; Action: déplacer une boite entre deux cases adjacentes horizontalement.
  ;; La précondition: l'agent se trouve sur la case voisine horizontalement à la case départ qui est adjacente horizontalement à la case d'arrivé.
  ;; L'effet: la boite se trouve sur la case d'arrivé et l'agent se trouve sur la case départ.
  (:action go_to_horizontal
    :parameters (?a - agent ?from_a - case ?from_b - case ?box - box ?target - case)
    :precondition (and (on ?a ?from_a) (box_on ?box ?from_b) (horizontal_adjacent ?from_a ?from_b)(free ?target)
     (horizontal_adjacent ?from_b ?target) (not_same ?from_a ?from_b) (not_same ?from_b ?target) 
      (not_same ?from_a ?target))
    :effect (and (on ?a ?from_b)(box_on ?box ?target) (not (on ?a ?from_a)) (not(box_on ?box ?from_b))
    (free ?from_a) (not (free ?target)))
  )


  ;; Action: déplacer une boite entre deux cases adjacentes verticalement.
  ;; La précondition: l'agent se trouve sur la case voisine verticalement à la case départ qui est adjacente verticalement à la case d'arrivé.
  ;; L'effet: la boite se trouve sur la case d'arrivé et l'agent se trouve sur la case départ.
  (:action go_to_vertical
    :parameters (?a - agent ?from_a - case ?from_b - case ?box - box ?target - case)
    :precondition (and (on ?a ?from_a) (box_on ?box ?from_b) (vertical_adjacent ?from_a ?from_b)
    (free ?target) (vertical_adjacent ?from_b ?target) (not_same ?from_a ?from_b) (not_same ?from_b ?target) 
      (not_same ?from_a ?target))
    :effect (and (on ?a ?from_b)(box_on ?box ?target) (not (on ?a ?from_a)) (not(box_on ?box ?from_b))
    (free ?from_a) (not (free ?target)))
  )
   
  ;; Action: placer une boite sur une case cible.
  ;; La précondition: l'agent se trouve sur la case et cette case est une case cible.
  ;; L'effet: la boite se trouve sur la case cible.
  (:action place_box_final
  :parameters (?box - box ?final_case - case)
  :precondition (and (box_on ?box ?final_case) (has_target ?final_case))
  :effect (box_on_final_case ?box ?final_case)
 )

)

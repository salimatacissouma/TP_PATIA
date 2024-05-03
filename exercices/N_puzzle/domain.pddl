;Header and description

(define (domain N-puzzle)

  ;remove requirements that are not needed
  (:requirements :strips :typing)

  (:types
    tile case
  )

  ; un-comment following line if constants are needed
  ;(:constants )
  (:constants
    free - tile
  )
  (:predicates ;todo: define predicates here
    (on ?t - tile ?c - case)
    (adjacent ?c1 - case ?c2 - case)
  )

  ;define actions here
  (:action move-tile
    :parameters (?t - tile ?from - case ?to - case)
    :precondition (and (on ?t ?from) (on free ?to)(adjacent ?from ?to))
    :effect (and (on ?t ?to) (on free ?from)
      (not (on ?t ?from))
      (not (on free ?to)))
  )
  (:action noop
    :parameters (?from - case ?to - case)
    :precondition (and (adjacent ?from ?to))
    :effect (and (adjacent ?to ?from))
  )

)
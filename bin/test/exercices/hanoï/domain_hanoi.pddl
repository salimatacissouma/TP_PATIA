;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; hanoi towers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (domain hanoi)
  ; Déclaration des exigences du domaine
  (:requirements :strips :typing)
  
  ; Définition des types d'objets
  (:types object tower)
  
  ; Définition des prédicats
  (:predicates
    ; Prédicat indiquant qu'un disque est libre
    (clear ?x - object)
    ; Prédicat indiquant que la main est vide
    (handempty)
    ; Prédicat indiquant qu'un disque est tenu en main
    (holding ?x - object)
    ; Prédicat indiquant qu'un disque est sur un autre disque
    (on ?x - object ?y - object)
    ; Prédicat indiquant qu'un disque est sur une tour
    (ontower ?x - object ?y - tower)
    ; Prédicat indiquant qu'un disque est plus grand qu'un autre disque
    (larger ?x - object ?y - object)
  )

	; Action: déplacer un disque d'un nœud à un autre
	; Précondition: Le disque à deplacer doit être libre et la main doit être vide.
	; Effet: Le disque n'est plus clair, il est tenu en main, et le disque sur lequel il était devient libre.
  (:action unstack
    :parameters (?x - object ?y - object)
    :precondition (and (clear ?x) (on ?x ?y) (handempty))
    :effect (and 
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
              (holding ?x)
              (clear ?y)
            )
  )

	; Action: empiler un disque sur un autre disque
	; Précondition: Le disque qui veut poser doit être tenu en main, le disque sur lequel il sera posé doit être libre et plus grang.
	; Effet: Le disque n'est plus tenu en main et est libre. le disque sur le quel il est posé n'est plus libre.

  (:action stack
    :parameters (?x - object ?y - object)
    :precondition (and (holding ?y) (clear ?x) (larger ?x ?y))
    :effect (and 
              (not (holding ?y))
              (not (clear ?x))
              (clear ?y)
              (handempty)
              (on ?y ?x)
            )
  )

	; Action: poser un disque sur une tour
	; Précondition: Le disque doit être tenu en main et la tour doit être libre.
	; Effet: Le disque n'est plus tenu en main et la tour n'est plus libre.
  (:action put-down
    :parameters (?x - object ?y - tower)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and 
              (not (holding ?x))
              (not (clear ?y))
              (clear ?x)
              (handempty)
              (ontower ?x ?y)
            )
  )

	; Action: prendre un disque sur une tour
	; Précondition: Le disque doit être sur la tour, il doit être libre, et la main doit être vide.
	; Effet: Le disque est maintenant tenu en main, il n'est plus libre, et il n'est plus sur la tour.
  (:action pick-up
    :parameters (?x - object ?y - tower)
    :precondition (and (ontower ?x ?y) (clear ?x) (handempty))
    :effect (and 
              (holding ?x)
              (clear ?y)
              (not (clear ?x))
              (not (handempty))
              (not (ontower ?x ?y))
            )
  )
	; Action: déplacer un disque d'une tour à une autre
	; Précondition: Le disque doit être sur la tour de départ, il doit être libre et la main doit être vide.
	; Effet: Le disque n'est plus libre, la tour de départ devient libre et le disque est placé sur la tour d'arrivé.
  (:action move-disc
    :parameters (?x - object ?from - tower ?to - tower)
    :precondition (and (ontower ?x ?from) (clear ?x) (handempty))
    :effect (and 
              (not (clear ?x))
              (clear ?from)
              (ontower ?x ?to)
              (not (ontower ?x ?from))
            )
  )
)


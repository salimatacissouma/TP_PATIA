(define (problem test_hanoi)
  (:domain hanoi)
  (:objects bleu blanc rouge - object left middle right - tower)
    ;; Les disques sont placés du plus grand au plus petit (rouge,blanc,bleu) sur la tour left.
    ;; Le disque bleu est libre.
    ;; Les tours middle et right sont libres.
    ;; La main est libre
  (:init
    (larger rouge blanc) ; Le disque rouge est plus grand que le disque blanc
    (larger blanc bleu) ; Le disque blanc est plus grand que le disque bleu
    (ontower rouge left)
    (on blanc rouge)
    (on bleu blanc)
    (clear bleu)
    (clear middle)
    (clear right)
    (handempty)
  )
    ;; Le but c'est de les placer les disques dans le même ordre sur la tour right.
  (:goal
    (and
      (ontower rouge right)
      (on blanc rouge)
      (on bleu blanc)
    )
  )
)

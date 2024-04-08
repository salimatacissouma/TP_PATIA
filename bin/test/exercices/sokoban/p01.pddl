(define (problem sokoban-test) (:domain sokoban)

  (:objects
    agent1 - agent
    box1 box2 - box
    place1 place2 case1 case2 case3  case5 case6 case8 case9 - case
  )

  (:init
    ; Positions initiales
    (on agent1 case1)   
    (box_on box1 case2)  
    (box_on box2 case3)   
    (free place1) (free place2)   ; Places libres
    (free case6) (free case5) 
    (free case8) (free case9) 

    (adjacent case1 case2)
    (adjacent case2 case1)
    (adjacent case1 case8)
    (adjacent case8 case1)

    (adjacent case2 place1)
    (adjacent place1 case2)
    (adjacent case2 case3)
    (adjacent case3 case2)

    (adjacent case8 case9)
    (adjacent case9 case8)
    (adjacent case8 case3)
    (adjacent case3 case8)

    (adjacent case9 case6)
    (adjacent case6 case9)

    (adjacent case3 case6)
    (adjacent case6 case3)
    (adjacent case3 case5)
    (adjacent case5 case3)

    (adjacent place1 case5)
    (adjacent case5 place1)
    (adjacent place2 case5)
    (adjacent case5 place2)

    (adjacent place2 case6)
    (adjacent case6 place2)



    (vertical_adjacent case1 case2)
    (vertical_adjacent case2 case1)

    (horizontal_adjacent case2 case3)
    (horizontal_adjacent case3 case2)

    (horizontal_adjacent case3 case6)
    (horizontal_adjacent case6 case3)

    (horizontal_adjacent case8 case1)
    (horizontal_adjacent case1 case8)

    (horizontal_adjacent case8 case9)
    (horizontal_adjacent case9 case8)

    (vertical_adjacent case8 case3)
    (vertical_adjacent case3 case8)

    (vertical_adjacent case9 case6)
    (vertical_adjacent case6 case9)

    (vertical_adjacent case3 case5)
    (vertical_adjacent case5 case3)

    (vertical_adjacent case2 place1)
    (vertical_adjacent place1 case2)

    (horizontal_adjacent place1 case5)
    (horizontal_adjacent case5 place1)

    (horizontal_adjacent case5 place2)
    (horizontal_adjacent place2 case5)

    (vertical_adjacent case6 place2)
    (vertical_adjacent place2 case6)


    (not_same place1 place2)
    (not_same place1 case1)
    (not_same place1 case2)
    (not_same place1 case3)
    (not_same place1 case5)
    (not_same place1 case6)
    (not_same place1 case8)
    (not_same place1 case9)

    (not_same place2 place1)
    (not_same place2 case1)
    (not_same place2 case2)
    (not_same place2 case3)
    (not_same place2 case5)
    (not_same place2 case6)
    (not_same place2 case8)
    (not_same place2 case9)

    (not_same case1 place1)
    (not_same case1 place2)
    (not_same case1 case2)
    (not_same case1 case3)
    (not_same case1 case5)
    (not_same case1 case6)
    (not_same case1 case8)
    (not_same case1 case9)

    (not_same case2 place1)
    (not_same case2 place2)
    (not_same case2 case1)
    (not_same case2 case3)
    (not_same case2 case5)
    (not_same case2 case6)
    (not_same case2 case8)
    (not_same case2 case9)

    (not_same case3 place1)
    (not_same case3 place2)
    (not_same case3 case1)
    (not_same case3 case2)
    (not_same case3 case5)
    (not_same case3 case6)
    (not_same case3 case8)
    (not_same case3 case9)

    (not_same case5 place1)
    (not_same case5 place2)
    (not_same case5 case1)
    (not_same case5 case2)
    (not_same case5 case3)
    (not_same case5 case6)
    (not_same case5 case8)
    (not_same case5 case9)

    (not_same case6 place1)
    (not_same case6 place2)
    (not_same case6 case1)
    (not_same case6 case2)
    (not_same case6 case3)
    (not_same case6 case5)
    (not_same case6 case8)
    (not_same case6 case9)

    (not_same case8 place1)
    (not_same case8 place2)
    (not_same case8 case1)
    (not_same case8 case2)
    (not_same case8 case3)
    (not_same case8 case5)
    (not_same case8 case6)
    (not_same case8 case9)

    (not_same case9 place1)
    (not_same case9 place2)
    (not_same case9 case1)
    (not_same case9 case2)
    (not_same case9 case3)
    (not_same case9 case5)
    (not_same case9 case6)
    (not_same case9 case8)

    (has_target place1)   
    (has_target place2)
  )

  (:goal
    ; Objectif : Les deux boîtes doivent être sur leurs places cibles respectives
    (and 
      (box_on_final_case box1 place1)
      (box_on_final_case box2 place2)
    )
  )
)

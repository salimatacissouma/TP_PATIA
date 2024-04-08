(define (problem sokoban-test1) (:domain sokoban)
(:objects 
    a - agent
    b - box
    c1 c2 c3 c4 - case
)

(:init
    (on a c1)   
    (box_on b c3)  
    (free c2)
    (free c4)

    (adjacent c1 c2)
    (adjacent c2 c1)
    (adjacent c2 c3)
    (adjacent c3 c2)
    (adjacent c3 c4)
    (adjacent c4 c3)
    
    (vertical_adjacent c1 c2)
    (vertical_adjacent c2 c1)

    (vertical_adjacent c2 c3)
    (vertical_adjacent c3 c2)
    
    (vertical_adjacent c3 c4)
    (vertical_adjacent c4 c3)

    (not_same c1 c2)
    (not_same c1 c3)
    (not_same c1 c4)


    (not_same c2 c3)
    (not_same c2 c1)
    (not_same c2 c4)

    (not_same c3 c1)
    (not_same c3 c2)
    (not_same c3 c4)

    (not_same c4 c1)
    (not_same c4 c2)
    (not_same c4 c3)

    (has_target c4)

    ;todo: put the initial state's facts and numeric values here
)

(:goal (and
    (box_on_final_case b c4)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

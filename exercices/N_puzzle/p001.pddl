(define (problem eight-puzzle)
    (:domain N-puzzle)
    (:objects
        tile1 tile2 tile3 tile4 tile5 tile6 tile7 tile8 free - tile
        case1 case2 case3 case4 case5 case6 case7 case8 case9 - case
    )

    (:init
        (on tile3 case1)
        (on tile7 case2)
        (on tile5 case3)
        (on free case4)
        (on tile1 case5)
        (on tile2 case6)
        (on tile8 case7)
        (on tile4 case8)
        (on tile6 case9)
        (adjacent case1 case2)
        (adjacent case1 case4)
        (adjacent case2 case3)
        (adjacent case2 case5)
        (adjacent case3 case6)
        (adjacent case4 case5)
        (adjacent case5 case6)
        (adjacent case4 case7)
        (adjacent case5 case8)
        (adjacent case6 case9)
        (adjacent case7 case8)
        (adjacent case8 case9)

    )

    (:goal
        (and
            ;todo: put the goal condition here
            (on tile1 case1)
            (on tile2 case2)
            (on tile3 case3)
            (on tile4 case4)
            (on tile5 case5)
            (on tile6 case6)
            (on tile7 case7)
            (on tile8 case8)
            (on free case9)
        )
    )

)
(define (problem freecell-8-1)
(:domain freecell)
(:objects
    S8
    H8
    D8
    C8
    S7
    H7
    D7
    C7
    S6
    H6
    D6
    C6
    S5
    H5
    D5
    C5
    S4
    H4
    D4
    C4
    S3
    H3
    D3
    C3
    SA
    S2
    S0
    HA
    H2
    H0
    DA
    D2
    D0
    CA
    C2
    C0
 - card
    N8
    N7
    N6
    N5
    N4
    N3
    N13
    N12
    N11
    N9
    N10
    N1
    N2
    N0
 - num
    S
    H
    D
    C
 - suit
)
(:init
    (VALUE C0 N0)
    (VALUE C2 N2)
    (VALUE C3 N3)
    (VALUE C4 N4)
    (VALUE C5 N5)
    (VALUE C6 N6)
    (VALUE C7 N7)
    (VALUE C8 N8)
    (VALUE CA N1)
    (VALUE D0 N0)
    (VALUE D2 N2)
    (VALUE D3 N3)
    (VALUE D4 N4)
    (VALUE D5 N5)
    (VALUE D6 N6)
    (VALUE D7 N7)
    (VALUE D8 N8)
    (VALUE DA N1)
    (VALUE H0 N0)
    (VALUE H2 N2)
    (VALUE H3 N3)
    (VALUE H4 N4)
    (VALUE H5 N5)
    (VALUE H6 N6)
    (VALUE H7 N7)
    (VALUE H8 N8)
    (VALUE HA N1)
    (VALUE S0 N0)
    (VALUE S2 N2)
    (VALUE S3 N3)
    (VALUE S4 N4)
    (VALUE S5 N5)
    (VALUE S6 N6)
    (VALUE S7 N7)
    (VALUE S8 N8)
    (VALUE SA N1)
    (SUCCESSOR N1 N0)
    (SUCCESSOR N10 N9)
    (SUCCESSOR N11 N10)
    (SUCCESSOR N12 N11)
    (SUCCESSOR N13 N12)
    (SUCCESSOR N2 N1)
    (SUCCESSOR N3 N2)
    (SUCCESSOR N4 N3)
    (SUCCESSOR N5 N4)
    (SUCCESSOR N6 N5)
    (SUCCESSOR N7 N6)
    (SUCCESSOR N8 N7)
    (SUCCESSOR N9 N8)
    (SUIT C0 C)
    (SUIT C2 C)
    (SUIT C3 C)
    (SUIT C4 C)
    (SUIT C5 C)
    (SUIT C6 C)
    (SUIT C7 C)
    (SUIT C8 C)
    (SUIT CA C)
    (SUIT D0 D)
    (SUIT D2 D)
    (SUIT D3 D)
    (SUIT D4 D)
    (SUIT D5 D)
    (SUIT D6 D)
    (SUIT D7 D)
    (SUIT D8 D)
    (SUIT DA D)
    (SUIT H0 H)
    (SUIT H2 H)
    (SUIT H3 H)
    (SUIT H4 H)
    (SUIT H5 H)
    (SUIT H6 H)
    (SUIT H7 H)
    (SUIT H8 H)
    (SUIT HA H)
    (SUIT S0 S)
    (SUIT S2 S)
    (SUIT S3 S)
    (SUIT S4 S)
    (SUIT S5 S)
    (SUIT S6 S)
    (SUIT S7 S)
    (SUIT S8 S)
    (SUIT SA S)
    (CANSTACK C2 D3)
    (CANSTACK C2 H3)
    (CANSTACK C3 D4)
    (CANSTACK C3 H4)
    (CANSTACK C4 D5)
    (CANSTACK C4 H5)
    (CANSTACK C5 D6)
    (CANSTACK C5 H6)
    (CANSTACK C6 D7)
    (CANSTACK C6 H7)
    (CANSTACK C7 D8)
    (CANSTACK C7 H8)
    (CANSTACK CA D2)
    (CANSTACK CA H2)
    (CANSTACK D2 C3)
    (CANSTACK D2 S3)
    (CANSTACK D3 C4)
    (CANSTACK D3 S4)
    (CANSTACK D4 C5)
    (CANSTACK D4 S5)
    (CANSTACK D5 C6)
    (CANSTACK D5 S6)
    (CANSTACK D6 C7)
    (CANSTACK D6 S7)
    (CANSTACK D7 C8)
    (CANSTACK D7 S8)
    (CANSTACK DA C2)
    (CANSTACK DA S2)
    (CANSTACK H2 C3)
    (CANSTACK H2 S3)
    (CANSTACK H3 C4)
    (CANSTACK H3 S4)
    (CANSTACK H4 C5)
    (CANSTACK H4 S5)
    (CANSTACK H5 C6)
    (CANSTACK H5 S6)
    (CANSTACK H6 C7)
    (CANSTACK H6 S7)
    (CANSTACK H7 C8)
    (CANSTACK H7 S8)
    (CANSTACK HA C2)
    (CANSTACK HA S2)
    (CANSTACK S2 D3)
    (CANSTACK S2 H3)
    (CANSTACK S3 D4)
    (CANSTACK S3 H4)
    (CANSTACK S4 D5)
    (CANSTACK S4 H5)
    (CANSTACK S5 D6)
    (CANSTACK S5 H6)
    (CANSTACK S6 D7)
    (CANSTACK S6 H7)
    (CANSTACK S7 D8)
    (CANSTACK S7 H8)
    (CANSTACK SA D2)
    (CANSTACK SA H2)
    (HOME C0)
    (HOME D0)
    (HOME H0)
    (HOME S0)
    (CELLSPACE N4)
    (COLSPACE N0)
    (ON C2 CA)
    (ON C3 H3)
    (ON C4 S2)
    (ON C5 D2)
    (ON C6 H8)
    (ON C8 D4)
    (ON CA SA)
    (ON D3 C2)
    (ON D4 HA)
    (ON D6 S3)
    (ON D7 S7)
    (ON D8 S4)
    (ON DA D5)
    (ON H2 D8)
    (ON H3 H5)
    (ON H4 DA)
    (ON H6 S5)
    (ON H8 H4)
    (ON HA C7)
    (ON S3 C4)
    (ON S6 D6)
    (ON S7 C3)
    (ON S8 C5)
    (ON SA H7)
    (CLEAR C6)
    (CLEAR C8)
    (CLEAR D3)
    (CLEAR D7)
    (CLEAR H2)
    (CLEAR H6)
    (CLEAR S6)
    (CLEAR S8)
    (BOTTOMCOL C7)
    (BOTTOMCOL D2)
    (BOTTOMCOL D5)
    (BOTTOMCOL H5)
    (BOTTOMCOL H7)
    (BOTTOMCOL S2)
    (BOTTOMCOL S4)
    (BOTTOMCOL S5)
)
(:goal (and
    (HOME C8)
    (HOME D8)
    (HOME H8)
    (HOME S8)
)))

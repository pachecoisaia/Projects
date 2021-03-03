cube([],[]).
cube([A|B],[C|D]):-(
    number(A)
    -> C is A * A * A, cube(B,D)
    ;  C =

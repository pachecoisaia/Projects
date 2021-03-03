solutions(L) :- L = [ [brown, _, _, _, _, _], [clark, _, _, _, _, _],
                      [jones, _, _, _, _, _], [smith, _, _, _, _, _] ],
                clue1(L),
                clue2(L),
                clue3(L),
                clue4(L),
                constrained_profession(L),
                constrained_age(L),
                constrained_income(L),
                constrained_politics(L),
                constrained_golf_rank(L).

clue1(L) :- member(P1,L), member(P2,L), member(P3,L),
            P1 = [brown, _, A1, _, L1, G1],
            P2 = [jones, _, _, _, L2, _],
            P3 = [smith, _, _, _, L3, _],
            liberaler( P2, P1 ),
            liberaler( P1, P3 ),
            not( clue1_helper_a(L) ),
            not( clue1_helper_b(L) ).

clue1_helper_a(L) :- member(P1,L), P1 = [brown, _, A1, _, L1, G1],
                     member(PU,L), PU = [_, _, AU, _, _, GU],
                     younger(PU,P1),
                     not(golfier(P1, PU)).

clue1_helper_b(L) :- member(P1,L), P1 = [brown, _, _, _, _, _],
                     member(P2,L), P2 = [clark, _, _, _, _, _],
                     member(PU,L), PU = [_, _, _, _, _, _],
                     younger(P2,PU),
                     not(richer(P1, PU)).

clue2(L) :- member(P1,L), member(P2,L),
            P1 = [_, banker, A1, I1, _, _],
            P2 = [_, architect, _, I2, _, _],
            richer(P1,P2),
            not( A1 = 1 ),
            not( A1 = 4 ).

clue3(L) :- member(P1, L), member(P2, L), member(P3,L),
            P1 = [_,doctor, _, _, L1, G1],
            P2 = [_,lawyer, _, _, _, G2],
            P3 = [_,architect, _, _, L3, _],
            golfier(P2,P1),
            liberaler(P1,P3).

clue4(L) :- member(P1,L), member(P2,L),
            P1 = [_, _, 4, 4, 1, _],
            P2 = [_, _, 1, _, _, 1].

constrained_profession(L) :-
    member(P1,L), member(P2,L), member(P3,L), member(P4,L),
    P1 = [_, banker, _, _, _, _],
    P2 = [_, lawyer, _, _, _, _],
    P3 = [_, doctor, _, _, _, _],
    P4 = [_, architect, _, _, _, _].

constrained_age(L) :-
    member(P1,L), member(P2,L), member(P3,L), member(P4,L),
    P1 = [_, _, 1, _, _, _],
    P2 = [_, _, 2, _, _, _],
    P3 = [_, _, 3, _, _, _],
    P4 = [_, _, 4, _, _, _].

constrained_income(L) :-
    member(P1,L), member(P2,L), member(P3,L), member(P4,L),
    P1 = [_, _, _, 1, _, _],
    P2 = [_, _, _, 2, _, _],
    P3 = [_, _, _, 3, _, _],
    P4 = [_, _, _, 4, _, _].

constrained_politics(L) :-
    member(P1,L), member(P2,L), member(P3,L), member(P4,L),
    P1 = [_, _, _, _, 1, _],
    P2 = [_, _, _, _, 2, _],
    P3 = [_, _, _, _, 3, _],
    P4 = [_, _, _, _, 4, _].

constrained_golf_rank(L) :-
    member(P1,L), member(P2,L), member(P3,L), member(P4,L),
    P1 = [_, _, _, _, _, 1],
    P2 = [_, _, _, _, _, 2],
    P3 = [_, _, _, _, _, 3],
    P4 = [_, _, _, _, _, 4].


younger(X,Y) :- X = [_, _, AX, _, _, _], Y = [_, _, AY, _, _, _], (AX < AY).

liberaler(X,Y) :- X = [_, _, _, _, LX, _], Y = [_, _, _, _, LY, _], (LX > LY).

golfier(X,Y) :- X = [_, _, _, _, _, GX], Y = [_, _, _, _, _, GY], (GX < GY).

richer(X,Y) :- X = [_, _, _, IX, _, _], Y = [_, _, _, IY, _, _], (IX > IY).

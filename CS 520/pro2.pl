%Name:Isaia Pacheco RedID:819438016
substit([],[]).
substit([H | T], [H1 | T1]):-
    (   H == sword -> H1 = plowshare; substit(H, H1)),
    substit(T, T1).
substit(L,R):-
    L =.. [F1 | Args1],
    substit(Args1, Args2),
    R =.. [F1 | Args2].

%[Name,profession,conservatism, age, wealth, skill
% 1 is the least conservative, youngest, poorest, least skillful
% 4 is the most conservative, oldest, wealthiest, most skillful
profession(L):-
    L = [ [brown,_,_,_,_,_], [jones,_,_,_,_,_],
          [smith,_,_,_,_,_], [clark,_,_,_,_,_] ],
    member([_,doctor,_,_,_,_],L),
    member([_,lawyer,_,_,_,_],L),
    member([_,banker,_,_,_,_],L),
    member([_,architect,_,_,_,_],L),
    member([_,_,1,_,_,_],L),
    member([_,_,2,_,_,_],L),
    member([_,_,3,_,_,_],L),
    member([_,_,4,_,_,_],L),
    member([_,_,_,1,_,_],L),
    member([_,_,_,2,_,_],L),
    member([_,_,_,3,_,_],L),
    member([_,_,_,4,_,_],L),
    member([_,_,_,_,1,_],L),
    member([_,_,_,_,2,_],L),
    member([_,_,_,_,3,_],L),
    member([_,_,_,_,4,_],L),
    member([_,_,_,_,_,1],L),
    member([_,_,_,_,_,2],L),
    member([_,_,_,_,_,3],L),
    member([_,_,_,_,_,4],L),
    clue1(L),
    clue2(L),
    clue3(L),
    clue4(L),
    clue5(L),
    clue6(L),
    clue7(L),
    clue8(L),
    clue9(L),
    clue10(L).

%[Name,profession,conservatism, age, wealth, skill
clue1(L):-
    member([brown,_,C1,_,_,_],L),
    member([jones,_,C2,_,_,_],L),
    C1>C2.

%[Name,profession,conservatism, age, wealth, skill
clue2(L):-
    member([brown,_,C3,_,_,_],L),
    member([smith,_,C4,_,_,_],L),
    C3<C4.

clue3(L):-
    member([brown,_,_,A1,_,S1],L),
    member([_,_,_,A2,_,S2],L),
    A1 < A2,
    S1 > S2,
    A1=1.

clue4(L):-
    member([brown,_,_,A1,W1,_],L),
    member([_,_,_,A2,W2,_],L),
    member([clark,_,_,A3,_,_],L),
    A1<A2,
    W2>W1,
    A3=4.


clue5(L):-
    member([_,banker,_,_,W3,_],L),
    member([_,architect,_,_,W4,_],L),
    W3>W4.

clue6(L):-
     member([_,banker,_,A5,_,_],L),
     not((A5=1)),
     not((A5=4)).

clue7(L):-
    member([_,doctor,_,_,_,S3],L),
    member([_,lawyer,_,_,_,S4],L),
    S3<S4.

clue8(L):-
    member([_,doctor,C5,_,_,_],L),
    member([_,architect,C6,_,_,_],L),
    C5<C6.

clue9(L):-
    member([_,_,4,4,4,_],L).

clue10(L):-
    member([_,_,_,1,_,4],L).

postorder(T):-
    T=.. [F|Args], maplist(postorder, Args),
    write(F), write(" ").

rev([],[]).
rev([H|T], X) :- rev(T, Y),
    append(Y, [H], X).













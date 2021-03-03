rev([],[]).
rev([H|T],[X|Y]):- Y is H, append(T, rev(T,Y, X)) .

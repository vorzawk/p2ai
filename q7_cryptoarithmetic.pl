% SEND + MORE = MONEY

% Each operation can be with or without a carry
dPlusE_equalsY(D,E,Y) :-
    between(0,9,D), between(0,9,E), Y is D+E, between(0,9,Y).
dPlusE_equalsY(D,E,Y) :-
    between(0,9,D), between(0,9,E), Y is D+E-10, between(0,9,Y).

nPlusR_equalsE(N,R,E) :-
    between(0,9,N), between(0,9,R), E is N+R, between(0,9,E).
nPlusR_equalsE(N,R,E) :-
    between(0,9,N), between(0,9,R), E is N+R-10, between(0,9,E).

ePlusO_equalsN(E,O,N) :-
    between(0,9,E), between(0,9,O), N is E+O, between(0,9,N).
ePlusO_equalsN(E,O,N) :-
    between(0,9,E), between(0,9,O), N is E+O-10, between(0,9,N).

sPlusM_equalsMO(S,M,O) :-
    % S and M cannot be 0 since numbers must be well-formed
    between(1,9,S), between(1,9,M), between(0,9,O), S+M =:= 10*M+O.

sENDplusMORE_equalsMONEY(S,E,N,D,M,O,R,Y) :-
   sPlusM_equalsMO(S,M,O), dPlusE_equalsY(D,E,Y), nPlusR_equalsE(N,R,E), ePlusO_equalsN(E,O,N), chkUnique([S,E,N,D,M,O,R,Y]).

chkUnique([H|T]) :-
    \+ member(H,T), chkUnique(T).

chkUnique([]).


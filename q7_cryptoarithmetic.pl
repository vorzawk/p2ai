% SEND + MORE = MONEY

% Each operation can be with or without a carry
dPlusE_equalsY(D,E,Y,Cde) :-
    between(0,9,D), between(0,9,E), Y is D+E, between(0,9,Y), Cde=0.
dPlusE_equalsY(D,E,Y,Cde) :-
    between(0,9,D), between(0,9,E), Y is D+E-10, between(0,9,Y), Cde=1.

nPlusR_equalsE(N,R,Cde,E,Cnr) :-
    between(0,9,N), between(0,9,R), E is N+R+Cde, between(0,9,E), Cnr=0.
nPlusR_equalsE(N,R,Cde,E,Cnr) :-
    between(0,9,N), between(0,9,R), E is N+R+Cde-10, between(0,9,E), Cnr=1.

ePlusO_equalsN(E,O,Cnr,N,Ceo) :-
    between(0,9,E), between(0,9,O), N is E+O+Cnr, between(0,9,N), Ceo=0.
ePlusO_equalsN(E,O,Cnr,N,Ceo) :-
    between(0,9,E), between(0,9,O), N is E+O+Cnr-10, between(0,9,N), Ceo=1.

sPlusM_equalsMO(S,M,Ceo,O) :-
    % S and M cannot be 0 since numbers must be well-formed
    between(1,9,S), between(1,9,M), between(0,9,O), S+M+Ceo =:= 10*M+O.

sENDplusMORE_equalsMONEY(S,E,N,D,M,O,R,Y) :-
   dPlusE_equalsY(D,E,Y,Cde), nPlusR_equalsE(N,R,Cde,E,Cnr), ePlusO_equalsN(E,O,Cnr,N,Ceo), sPlusM_equalsMO(S,M,Ceo,O), chkUnique([S,E,N,D,M,O,R,Y]).

chkUnique([H|T]) :-
    \+ member(H,T), chkUnique(T).

chkUnique([]).


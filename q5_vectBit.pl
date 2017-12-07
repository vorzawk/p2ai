% Create a bit vector
bitvec(N,V) :-
    recBitVect(N,1,[],V).

% Recursively build a list of 0s and 1s by appending to the head of the list
recBitVect(N,K,Acc,BitVect) :-
    K=<N, Knext is K+1, recBitVect(N,Knext,[0|Acc],BitVect).

recBitVect(N,K,Acc,BitVect) :-
    K=<N, Knext is K+1, recBitVect(N,Knext,[1|Acc],BitVect).

% Base condition is when we have the bit vector size we need.
recBitVect(N,K,Acc,Acc) :-
    K>N.

% Given a bit vector, count the number of set bits.
cntSetBits([H|T],K) :-
    recCntSetBits([H|T],0,K).

recCntSetBits([H|T],M,K) :- 
    H=1, Mnext is M+1, recCntSetBits(T,Mnext,K).

recCntSetBits([H|T],M,K) :- 
    \+ H=1, recCntSetBits(T,M,K).

% Base condition is when we have processed the entire vector.
recCntSetBits([],M,M).

barCode(M,K,Code) :-
    bitvec(M,Code), cntSetBits(Code,K).

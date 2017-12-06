% Create a bit vector
bitvec(N,V) :-
    recBitVect(N,1,[],V).

recBitVect(N,K,Acc,BitVect) :-
    K=<N, Knext is K+1, recBitVect(N,Knext,[0|Acc],BitVect).

recBitVect(N,K,Acc,BitVect) :-
    K=<N, Knext is K+1, recBitVect(N,Knext,[1|Acc],BitVect).

recBitVect(N,K,Acc,Acc) :-
    K>N.

cntSetBits([H|T],K) :-
    recCntSetBits([H|T],0,K).

recCntSetBits([H|T],M,K) :- 
    H=1, Mnext is M+1, recCntSetBits(T,Mnext,K).

recCntSetBits([H|T],M,K) :- 
    \+ H=1, recCntSetBits(T,M,K).

recCntSetBits([],M,M).

barCode(M,N,Code) :-
    bitvec(M,Code), cntSetBits(Code,K), K=N.

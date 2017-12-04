prereq(db, algos).
prereq(algos, ugAlgos).

needed(X, Y) :- prereq(Y,X).
needed(X,Y) :- prereq(Y, Z), needed(X,Z).

even_digit(Y) :- between(1,10,Y), divisible(Y,2).

list(M,N,L) :- between(M,N,X), add2List(X,L,M).
add2List(X,L,M) :- M=X, L=[X].
add2List(X,L,M) :- \+ (M=X), append([X],L,L).
% list(M,N,L) :- between(M,N,X), append([X],L,L).




#Rules
divisible(N,X) :- M is N mod X, M=0. 
%We want to return the list of prime factors in P, however we cannot build the list using P since variables in prolog can be bound only once.
%Instead, recursively accumulate the factors and then bind the list to P
primeFactors(N,P) :- 
    listPrimeFactors(N,2,[],P).

%If For each number between 2 and N, check if it is a prime factor and add it to the list if it is. Otherwise, just proceed to the next number.
listPrimeFactors(N,K,Acc,ListPrime) :- K=<N, primeFactorCheck(N,K), Knext is K+1, listPrimeFactors(N,Knext,[K|Acc],ListPrime).
listPrimeFactors(N,K,Acc,ListPrime) :- K=<N, \+ primeFactorCheck(N,K), Knext is K+1, listPrimeFactors(N,Knext,Acc,ListPrime).

%Base condition for recursion
listPrimeFactors(N,M,Acc,Acc) :- N=M.

primeFactorCheck(N,P) :- M is N-1, between(2,M,P), divisible(N,P), \+ primeFactorCheck(P,_).



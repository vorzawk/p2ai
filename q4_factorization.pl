#Rules
divisible(N,X) :- M is N mod X, M=0. 
% Factors without considering 1 and the number itself
factors(N,F) :- M is N-1, between(2,M,F), divisible(N,F).
primeFactors(N,P) :- factors(N,P), \+ factors(P,_).

#Outputs all the prime factors but can't seem to figure out how to put them in a list!

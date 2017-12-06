list(M,N,List) :- listHelp(M,N,[],List).
listHelp(M,N,Acc,List) :- K is M+1, M=<N, listHelp(K,N,[M|Acc],List).
listHelp(M,N,Acc,Acc) :- M>N.

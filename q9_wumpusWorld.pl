% Wumpus World 
% The goal is to infer a room which is safe to visit. For this, I need to
% define a function which lists all the candidate rooms which can be visited.
% Among these, the room which is safe to visit must be inferred.

validRoom(X,Y) :- 
    % We only want to consider rooms in a 4*4 grid.
    between(1,4,X), between(1,4,Y).

candidate(X,Y) :-
    adjacent(X,Y,P,Q), visited(P,Q), \+ visited(X,Y).

adjacent(K,L,M,N) :-
    % In the same row
    validRoom(K,L), validRoom(M,N), L=N, Diff is K-M, abs(Diff) =:= 1. 
    
adjacent(K,L,M,N) :-
    % In the same column
    validRoom(K,L), validRoom(M,N), K=M, Diff is L-N, abs(Diff) =:= 1. 

noStench(P,Q) :-
    visited(P,Q), \+ stench(P,Q).

noBreeze(P,Q) :-
    visited(P,Q), \+ breeze(P,Q).

noWumpus(P,Q) :- 
    % adjacent(P,Q,R,S), \+ stench(R,S). - doesn't work because prolog assumes
    % unasserted values to be false.
    adjacent(P,Q,R,S), noStench(R,S).

noPit(P,Q) :- 
    adjacent(P,Q,R,S), noBreeze(R,S).

safeToEnter(P,Q) :- 
    candidate(P,Q), noPit(P,Q), noWumpus(P,Q).

% State Description
visited(4,1).
visited(4,2).
visited(4,3).
visited(4,4).
stench(4,2).
breeze(4,3).
breeze(4,4).

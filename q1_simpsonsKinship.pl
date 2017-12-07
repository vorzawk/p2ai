%Facts
parent(bart,homer).
parent(bart,marge).
parent(lisa,homer).
parent(lisa,marge).
parent(maggie,homer).
parent(maggie,marge).
parent(homer,abraham).
parent(herb,abraham).
parent(tod,ned).
parent(rod,ned).
parent(marge,jackie).
parent(patty,jackie).
parent(selma,jackie).
female(maggie).
female(lisa).
female(marge).
female(patty).
female(selma).
female(jackie).
male(bart).
male(homer).
male(herb).
male(burns).
male(smithers).
male(tod).
male(rod).
male(ned).
male(abraham).

%Rules
brother(X,Y) :- parent(X,P), parent(Y,P), male(Y), \+ X = Y.
sister(X,Y) :- parent(X,P), parent(Y,P), female(Y), \+ X = Y.
aunt(X,Y) :- parent(X,P), sister(P,Y). 
uncle(X,Y) :- parent(X,P), brother(P,Y). 
grandfather(X,Y) :- parent(X,P), parent(P,Y), male(Y).
grandson(X,Y) :- parent(Y,P), parent(P,X), male(Y).
grandmother(X,Y) :- parent(X,P), parent(P,Y), female(Y).
granddaughter(X,Y) :- parent(Y,P), parent(P,X), female(Y).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).
descendent(X,Y) :- parent(Y,X).
descendent(X,Y) :- parent(Y,Z), descendent(X,Z).
unrelated(X,Y) :- \+ brother(X,Y), \+ sister(X,Y), \+ aunt(X,Y), \+ uncle(X,Y), \+ descendent(X,Y), \+ ancestor(X,Y).

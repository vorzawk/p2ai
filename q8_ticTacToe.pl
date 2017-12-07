% Knowledge base for Tic-Tac Toe

% State Description : If there isn't an x or an o, the spot is blank
b(R,C) :- \+ p(_,R,C).

% Horizontal Rows
canWin(U,R,3) :-
    p(U,R,1), p(U,R,2), b(R,3).
canWin(U,R,2) :-
    p(U,R,1), p(U,R,3), b(R,2).
canWin(U,R,1) :-
    p(U,R,2), p(U,R,3), b(R,1).

% Vertical Columns
canWin(U,3,C) :-
    p(U,2,C), p(U,1,C), b(3,C).
canWin(U,2,C) :-
    p(U,3,C), p(U,1,C), b(2,C).
canWin(U,1,C) :-
    p(U,2,C), p(U,3,C), b(1,C).

% Diagonals
canWin(U,3,3) :-
    p(U,1,1), p(U,2,2), b(3,3).
canWin(U,2,2) :-
    p(U,1,1), p(U,3,3), b(2,2).
canWin(U,1,1) :-
    p(U,2,2), p(U,3,3), b(1,1).

canWin(U,1,3) :-
    p(U,2,2), p(U,3,1), b(1,3).
canWin(U,2,2) :-
    p(U,3,1), p(U,1,3), b(2,2).
canWin(U,3,1) :-
    p(U,2,2), p(U,1,3), b(3,1).

% Winning move
move(U,R,C) :- canWin(U,R,C), write('go for the win!').

% Forced Move
move(U,R,C) :- \+ canWin(U,_,_), canWin(_,R,C), write('block opponent from winning!').

% State description
p(x,1,1).
p(x,2,3).
p(o,3,1).
p(o,3,3).


% Find the zeros of sin(x)

% May be if we had an really intelligent program, the statement below would
% return the root of sin(x), since we don't we can use Newton's method.
chkSinxZero(Y) :- 
    sin(Y) < 0.0001, sin(Y) > -0.0001.
% The above statement works just fine as check to see if a given value is a root 

% Given an initial guess, we want to return the closest root
sinxZero(X,Y) :- chkSinxZero(X), Y is X.
% Decrementing X by f/f' at each iteration
sinxZero(X,Y) :- \+ chkSinxZero(X), Xnext = X - sin(X)/cos(X), sinxZero(Xnext,Y).

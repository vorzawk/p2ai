%Rules
chkDupsExist(List) :- append(_,[Elem|Right],List),member(Elem,Right).
remDups(List,List) :- \+ chkDupsExist(List).
remDups(List,Reslist) :- append(Left,[Elem|Right],List), member(Elem,Right), append(Left,Right,Intlist), remDups(Intlist,Reslist).

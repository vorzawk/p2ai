%Rules
%Instead of the not I want to say NOT EXISTS Elem, right now, it finds an Elem to satisfy this even though duplicates exist
dupsexist(List) :- append(Left,[Elem|Right],List),member(Elem,Right).
remdups(List,Reslist) :- not(dupsexist(List)), Reslist = List.
remdups(List,Reslist) :- append(Left,[Elem|Right],List), member(Elem,Right), append(Left,Right,Intlist), remdups(Intlist,Reslist).

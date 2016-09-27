:- initialization(consult('kinship.pro')).

brother_1(X,Y) :- male(X), parent(P,X), parent(P,Y), \+ X = Y.
%brother(X,Y) :- male(X), parent(P1,X), parent(P1,Y), parent(P2,X), parent(P2,Y),
%	 female(P1),male(P2), \+ X = Y.

married_1(X,Y) :- parent(X,Ch), parent(Y,Ch), \+ X = Y.
husband_1(X,Y) :- male(X), married(X,Y).

brother(X,Y) :- findall(X, brother_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

married(X,Y) :- findall(X, married_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

husband(X,Y) :- findall(X, husband_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

num_of_children(X,N):- findall(Ch, parent(X,Ch), L), set(L,Lst), length(Lst,N).

set([], []).
set([H|T], [H|T1]) :- subtract(T, [H], T2), set(T2, T1).

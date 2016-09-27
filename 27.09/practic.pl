:- initialization(consult('kinship.pro')).

pred(X,Y) :- parent(X,Y).
pred(X,Y) :- parent(X,Z), pred(Z,Y).

brother_1(X,Y) :- male(X), parent(P,X), parent(P,Y), \+ X = Y.

married_1(X,Y) :- parent(X,Ch), parent(Y,Ch), \+ X = Y.
husband_1(X,Y) :- male(X), married(X,Y).

brother(X,Y) :- findall(X, brother_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

married(X,Y) :- findall(X, married_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

husband(X,Y) :- findall(X, husband_1(X,Y), L), set(L,Lst), nth(_,Lst,X).

num_of_children(X,N):- findall(Ch, parent(X,Ch), L), set(L,Lst), length(Lst,N).

subtract([], _, []) :- !.
subtract([A|C], B, D) :-
        memberchk(A, B), !,
        subtract(C, B, D).
subtract([A|B], C, [A|D]) :-
        subtract(B, C, D).

set([], []).
set([H|T], [H|T1]) :- subtract(T, [H], T2), set(T2, T1).

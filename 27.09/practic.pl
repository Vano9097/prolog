:- initialization(consult('kinship.pro')).

pred(X,Y) :- (var(Y);var(X)), parent(X,Y).
pred(X,Y) :- nonvar(X), nonvar(Y), parent(X,Y),!.
pred(X,Y) :- parent(X,Z), pred(Z,Y).

b_or_s_1(X,Y) :- parent(P,X), parent(P,Y),parent(P1,X), parent(P1,Y), \+ X = Y.
b_or_s(X,Y) :- setof(Y, b_or_s_1(X,Y), Lst), nth(_,Lst,Y).
brother_1(X,Y) :- male(X), parent(P,X), parent(P,Y),parent(P1,X), parent(P1,Y), \+ P1 = P, \+ X = Y.

married_1(X,Y) :- parent(X,Ch), parent(Y,Ch), \+ X = Y.
husband_1(X,Y) :- male(X), married(X,Y).

brother(X,Y) :- setof(X, brother_1(X,Y), Lst), nth(_,Lst,X).

married(X,Y) :- setof(X, married_1(X,Y), Lst), nth(_,Lst,X).

husband(X,Y) :- setof(X, husband_1(X,Y), Lst), nth(_,Lst,X).

num_of_children(X,N):- setof(Ch, parent(X,Ch), Lst), length(Lst,N).

cousin(X,Y) :- parent(F,X), nephews(Lst,F), nth(_,Lst,Y). 

nephews(Lst,Man) :- findall(Ch,(parent(X,Ch),b_or_s(X,Man)),L), sort(L,Lst).

famiy(L) :- L = [Father,Mother|Ls],
	setof(Ch,(parent(Father,Ch),parent(Mother,Ch)), Lst), Ls = Lst.

p1(X,Y,Z) :- Z=X+Y.

p2(X,Y,Z) :- Z is X+Y.

p(X) :- X=0.

p3(X):- X is 0.

ints(0).
ints(X) :- ints(Y), X is Y + 1.


delit(X,Y) :- Z is Y mod X, Z =:= 0.
nedelit(X,Y) :- Z is Y mod X, Z =\= 0.

prost(X) :- ints(X), Y is X - 1, max_del(Otv,X,Y), Otv =\= 1.
max_del(_Y,_X,1).
max_del(_Otv,X,I) :- I > 0, delit(I,X), max_del(I,X,1).
max_del(_Otv,X,I) :- I > 0, nedelit(I,X), max_del(_Otv,X,Y), Y is I - 1.

isPr(I,I):-!.

chet(X) :- delit(2,X).
nechet(X) :- not(delit(2,X)).

factorial(1, 1).
factorial(X, Result) :-
    X > 0,
    X1 is X - 1,
    factorial(X1, Result1),
    Result is X * Result1.
 
main :-
    factorial(7, X),
    writeln(X).
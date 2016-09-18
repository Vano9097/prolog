fist(El,Lst) :- Lst = [El|_].
second(El,Lst) :- Lst = [_,El|_].

reverse1(Lst1,Lst2) :- 
	iter_reverse(Lst1,[],Lst2).

iter_reverse([],K,K).
iter_reverse(Lst1,Rez,Lst2) :- 
	length(Lst1,N), N > 0, Lst1 = [_|Lst1_1], Lst1 = [A|_], Rez1 = [A|Rez],iter_reverse(Lst1_1,Rez1,Lst2).
sim(Lst) :- reverse1(Lst,L), L = Lst.

%task4(_Lst1,[]).
%task4(Lst1,Lst2) :- write(Lst1),nl,

%	length(Lst1,N1), N1 > 0, length(Lst2,N2), N2 > 0, 
%	fist(A1,Lst1), fist(A2,Lst2), A1 = A2, Lst1_1 = [_|Lst1], Lst2_1 = [_|Lst2], task4(Lst1_1,Lst2_1).	

%task4(Lst1,Lst2) :- 
%	write(Lst1),nl,
%	length(Lst1,N1), N1 > 0, length(Lst2,N2), N2 > 0, 
%	fist(A1,Lst1), fist(A2,Lst2), \+ A1 = A2, Lst1_1 = [_|Lst1], task4(Lst1_1,Lst2).
task4(Lst1,Lst2) :-	iter_task4(Lst1,[],Lst2).

iter_task4([],K,M) :- write('fail'),reverse1(K,M).
iter_task4(Lst1,Rez,Lst2) :- length(Lst1,N1), N1 > 0, Lst1 = [H|T], \+prost(H), iter_task4(T,Rez,Lst2).
%iter_task4(Lst1,Rez,Lst2) :- length(Lst1,N1), N1 > 0, Lst1 = [H|T], prost(H), Rez1 = [H|Rez], iter_task4(T,Rez1,Lst2).

iter_task4(Lst1,Rez,Lst2) :- length(Lst1,N1), N1 > 0, Lst1 = [H|T], prost(H), iter_task4(T,Rez1,Lst2), Rez = [H|Rez1] .



delit(X,Y) :- Z is Y mod X, Z =:= 0.
chet(X) :- delit(2,X).
nechet(X) :- \+chet(X).


prost(N) :- integer(N), N is 1, !, fail.
prost(X) :-
	\+prost_iter(2,X).

prost(1) :- !,fail.
prost_iter(I,X) :-  X**(1/2) >= I, delit(I,X).
prost_iter(I,X) :-  X**(1/2) >= I, I1 is I + 1, prost_iter(I1,X).

p1(X,Y,Z) :- Z=X+Y.
p2(X,Y,Z) :- Z is X+Y.

factor(N,Res) :- 
%	var(N),
	(integer(Res); float(Res)),
	factor_iter(1,Res,N).
	
factor_iter(K,1,K).
factor_iter(K,1.0,K).
factor_iter(I,Res,N) :- Res > 1, I1 is I + 1, Res1 is Res / I1, 
	factor_iter(I1,Res1,N).
	


duble_factor(N,Res) :- 
	(integer(Res); float(Res)),
	chet(N),
	duble_factor_iter(0,Res,N).

duble_factor(N,Res) :- 
	(integer(Res); float(Res)),
	\+chet(N),
	duble_factor_iter(1,Res,N).
	
duble_factor_iter(K,1,K).
duble_factor_iter(K,1.0,K).
duble_factor_iter(I,Res,N) :- Res > 1, I1 is I + 2, Res1 is Res / I1, 
	duble_factor_iter(I1,Res1,N).
	
delit(X,Y) :- Z is Y mod X, Z =:= 0.
chet(X) :- delit(2,X).
nechet(X) :- \+chet(X).

prost(X) :-
	\+prost_iter(2,X).

prost(1) :- fail.
prost_iter(I,X) :-  X**(1/2) >= I, delit(I,X).
prost_iter(I,X) :-  X**(1/2) >= I, I1 is I + 1, prost_iter(I1,X).
 

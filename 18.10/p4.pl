between(A2,A2,X):- X = A2,!.
between(A2,A2,X):- \+ X = A2,!,fail.
between(A1,A2,_X):- A1 > A2,!,fail.
between(A1,A2,X):-  A1 =< A2,X=A1;A is A1+1,between(A,A2,X).

check1(Lst,D) :- nth(D,Lst,Ch), nth(1,Lst,P),nth(2,Lst,V), 
	((Ch,\+ P, \+ V);
	(\+ Ch, (P; V))).
check2(Lst,D) :- Now is (D + 1) mod 7, nth(Now,Lst,Ch),
	((Ch, (Now = 4; Now = 6; Now = 7));(\+ Ch, \+ Now = 4, \+ Now = 6,\+ Now = 7)).

check3(Lst,D):- Now is (D + 2) mod 7, nth(Now,Lst,Ch),  nth(3,Lst,S),nth(5,Lst,P), 
	((Ch, \+ S, \+P);(\+ Ch,(S; P))).

solve_i(R):-
	permutation([true,fail,fail,fail,fail,fail,fail],R),
	between(1,7,D),
	check1(R,D),
	check2(R,D),
	check3(R,D).

solve(L):- setof(R,solve_i(R),Lst), nth(_,Lst,L). 

	

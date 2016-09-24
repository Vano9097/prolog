delit(X,Y) :- Z is Y mod X, Z =:= 0.
chet(X) :- delit(2,X).
 
sirakuz(0,_A).
sirakuz(N,An) :- N > 0,chet(An), N1 is N - 1, A1 is An//2 ,write(A1),nl , sirakuz(N1,A1).
sirakuz(N,An) :- N > 0, \+chet(An), N1 is N - 1, A1 is 3*An + 1 ,write(A1), nl, sirakuz(N1,A1). 

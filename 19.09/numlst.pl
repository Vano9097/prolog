numlst(N,Lst) :- var(N), var(Lst), iter_numlst_find(0,_).
numlst(N,Lst):-integer(N), iter_numlst(N,[],Lst).

iter_numlst(N,Rez,Lst) :- 
	N > 9, !,	Q is N // 10,  R is N mod 10, iter_numlst(Q,[R|Rez],Lst);
	[N|Rez]=Lst. 

iter_numlst_find(N,Lst) :-  iter_numlst(N,[],Lst), write(N), write(' - '), write(Lst), nl, N1 is N + 1, iter_numlst_find(N1,_). 
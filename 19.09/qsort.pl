qsort([H|T],Lst) :- split_qsort(H,T,L,R), qsort(L,SortL), qsort(R,SortR), 
	append(SortL,[H|SortR],Lst).
qsort([], []).
	
split_qsort(_,[],[],[]).
split_qsort( H, [U|T], [U|SortL], SortR ) :- U =< H, 
	split_qsort(H, T, SortL, SortR).
split_qsort( H, [U|T], SortL, [U|SortR] ) :- U  > H, 
	split_qsort(H, T, SortL, SortR).

comp(El1, El2, Order) :- 
  atom(Order),
  Term =.. [Order, El1, El2], 
  call(Term).


filter([],[],_Order).
filter(Lst1,Lst2,Order) :- atom(Order), findall(X,(member(X,Lst1), 
	Term =.. [Order,X], call(Term)),Lst2).

foldl(X0,_Oreder,[],Rez) :- X0 = Rez,!.
foldl(X0,Order,[H|T],Rez) :- atom(Order),  Term =.. [Order, X0, H, X1], 
  call(Term), foldl(X1,Order,T,Rez).


  
myMax4(X,Y,Z) :-
  X > Y,  !, Z = X ; 
  Z = Y.   
  
addHead(_X, [],[]):-!.
addHead(X, [H1|T1],[H2|T2]) :- H2 = [X|H1], addHead(X,T1,T2).

subsets(L,Set) :- subsets_iter(L,[[]],Rez),
	(Set = Rez, ! ; mysort(Set,Rez), !).
subsets_iter([],Set,Rez) :- mysort(Set,Rez).
subsets_iter([H|T],Set,Rez) :- addHead(H,Set,S), 
	append(Set,S,Set1) ,subsets_iter(T,Set1,Rez).
	

map(_Order,[],[]):-!.

map(Order,[H1|T1],[H2|T2]) :- atom(Order), Term =.. [Order, H1, H2], 
  call(Term), map(Order,T1,T2).


mysort(Lst,Rez):- map(sort,Lst,L),sort(L,Rez).


thing(plate,1,1.5).

thing(jar,3,5).

thing(silverSpoon,0.3,15).

sack(3).

weight(X,W):-thing(X,W,_).
price(X,P):-thing(X,_,P).

included(Lst) :- map(weight,Lst,WLst), sum_list(WLst,SumW), 
	sack(MaxWeight), SumW =< MaxWeight.
prices(Lst,P) :- map(price,Lst,PLst), sum_list(PLst,P).

pack(Things,MaxPrice) :- findall(Thing, thing(Thing,_,_) ,List_of_Things),
	subsets(List_of_Things,Sets), filter(Sets,WSets,included), 
	map(prices,WSets,PSets), max_list(PSets,MaxPrice), 
	nth(I,PSets,MaxPrice), nth(I,WSets,Things).
	
	


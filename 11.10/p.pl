%~ task 2

ribbonDiag([]):-!.
ribbonDiag([H|T]):- myprint(H),(T = [],ribbonDiag(T),!;! ,nl,ribbonDiag(T)).
myprint(0):-!.
myprint(A):-write('*'),A1 is A-1,myprint(A1).

%~ task 4
between(A2,A2,X):- X = A2,!.
between(A2,A2,X):- \+ X = A2,!,fail.
between(A1,A2,_X):- A1 > A2,!,fail.
between(A1,A2,X):-  A1 =< A2,X=A1;A is A1+1,between(A,A2,X).

%~ task 1
rec_rev(Lst,Rez):- rec_rev_iter(Lst,[],Rez).
rec_rev_iter([],Otv,Rez):-Otv = Rez.
rec_rev_iter([H|T],Otv,Rez):- list(H), rec_rev_iter(H,[],Q), Otv1 = [Q|Otv],
	rec_rev_iter(T,Otv1,Rez).
rec_rev_iter([H|T],Otv,Rez):- \+ list(H), Otv1 = [H|Otv],
	rec_rev_iter(T,Otv1,Rez).


%~ task 3
myMax4(X,Y,Z) :-
  X > Y,  !, Z = X ; 
  Z = Y.   
  

abs2(X,Y) :- Y is abs(X).

barDiag(L) :- max_list(L,Max), min_list(L,Min), myMax4(Max,0,Start), barDiag_iter(L,Start,Max,Min).

barDiag_iter(L,I,Max,Min):- (between(Min,Max,I);between(Min,0,I);between(0,Max,I)),
	!,print_bar(L,I),I1 is I - 1,
	barDiag_iter(L,I1,Max,Min).

print_bar([],0):- write('-'),nl,!.	
print_bar([],_):-nl,!.
print_bar([_|T],0):- write('-*'),print_bar(T,0).
print_bar([H|T],I):- \+ I = 0,((\+H = 0,(between(H,0,I);between(0,H,I)),!, 
	write(' '),write('*'),print_bar(T,I));
	write('  '),print_bar(T,I)).




%~ task 5

onTable(a).
onTable(b).
onTable(d).
onTable(e).
onBox(c,b).
onBox(f,d).
onBox(f,e).

%~ onTable(a).
%~ onTable(b).
%~ onTable(d).
%~ onTable(e).
%~ onTable(p).
%~ onTable(x).
%~ onTable(m).
%~ onBox(n,m).
%~ onBox(y,x).
%~ onBox(z,y).
%~ onBox(q,p).
%~ onBox(r,q).
%~ onBox(c,b).
%~ onBox(t,c).
%~ onBox(s,c).
%~ onBox(f,d).
%~ onBox(f,e).



mymember(X,[X|_]):- !.
mymember(X,[_|T]) :- mymember(X,T).

set([],[]).
set([H|T],[H|Out]) :-
   \+ mymember(H,T),
   !,
set(T,Out).
set([H|T],Out) :-
   mymember(H,T),
   set(T,Out).



leaf(A) :- onTable(A).
box(A) :- findall(A,(onBox(A,_);onTable(A)),L),set(L,Rez),nth(_,Rez,A).

top(A) :- box(A), \+ onBox(_,A). 
top_stack(A) :- top(A) , \+ inTower(A).
low_stack(A) :- onTable(A) , \+ inTower(A).




inTower(B) :- setof(X,inTower_f(X),Rez), nth(_,Rez,B).
inTower(B) :- onTable(B), onBox(Q,B) ,setof(X,inTower_f(X),Rez), nth(_,Rez,Q).
inTower_f(A) :- box(A), onBox(A,B1), onBox(A,B2), \+ B1 = B2 .
inTower_f(A) :- box(A), onBox(B1,A), onBox(B2,A), \+ B1 = B2 .
inTower_f(A) :- box(A), onBox(A,B1), onBox(A,B2), B1 = B2 , inTower_f(B1).
inTower_f(A) :- box(A), onBox(A,B1), onBox(A,B2), B1 = B2 , inTower_f(B1).


dfs(A,[A|Path],[A|Path]).
dfs(A,[Y|Path1],Path):- 
	(onBox(X,Y);onBox(Y,X)), % Ребро
	\+(member(X,Path1)),
	dfs(A,[X,Y|Path1],Path).

comp_i(L) :- box(A), findall(Q,( dfs(Q,[A],_)), Lst), sort(Lst,L).
comp(R) :- setof(L,comp_i(L),R). 

stack(N,Z) :- comp(L), nth(_,L,Comp), nth(_,Comp,Start), onTable(Start), 
	\+ inTower(Start), nth(_,Comp,End), top(End), dfs(End,[Start],Rez), 
	length(Rez,N),
	N > 1, %отделить еденичный кубик?
	Z = Rez.




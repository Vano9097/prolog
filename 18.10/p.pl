% state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat)
%   

opposite(left,right).
opposite(right,left).
un_opposite(X,Y) :- var(Y), X = Y.

%unsafe(state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2))

%Daughter
unsafe(state(_,_,Father,Mother,_,_,_,Daughter2,Boat)) :- Father = Daughter2, opposite(Father,Boat),  opposite(Father,Mother),
	opposite(Daughter2,Mother).

unsafe(state(_,_,Father,Mother,_,_,Daughter1,_,Boat)) :- Father = Daughter1, opposite(Father,Boat), opposite(Father,Mother),
	opposite(Daughter1,Mother).

%Son
unsafe(state(_,_,Father,Mother,Son1,_,_,_,Boat)) :- Mother = Son1, opposite(Son1,Father), opposite(Mother,Boat), opposite(Father,Mother).
unsafe(state(_,_,Father,Mother,_,Son2,_,_,Boat)) :- Mother = Son2, opposite(Son2,Father), opposite(Mother,Boat), opposite(Father,Mother).


unsafe(state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat)) :- 
	opposite(Police,Prisoner), Boat = Prisoner, %opposite(Boat,Prisoner),
	(Prisoner = Father ; Prisoner = Mother ; Prisoner = Son1 ; 
		Prisoner =Son2 ; Prisoner =Daughter1 ; Prisoner =Daughter2).
		
%Move Один
%~ move(state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat),
	 %~ state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat))
	 
move(state(Police1,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Police1 = Boat1,opposite(Police1,Police2),opposite(Boat1,Boat2).

move(state(Police,Prisoner1,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner2,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Prisoner1 = Boat1,opposite(Prisoner1,Prisoner2),opposite(Boat1,Boat2).

move(state(Police,Prisoner,Father1,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner,Father2,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Father1 = Boat1,opposite(Father1,Father2),opposite(Boat1,Boat2).

move(state(Police,Prisoner,Father,Mother1,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner,Father,Mother2,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Mother1 = Boat1,opposite(Mother1,Mother2),opposite(Boat1,Boat2).

move(state(Police1,Prisoner1,Father1,Mother1,Son11,Son2,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner2,Father2,Mother2,Son12,Son2,Daughter1,Daughter2,Boat2)) :-
	 opposite(Boat1,Boat2), 
	 (
		(opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Police1 = Son11) ;
		(un_opposite(Police1,Police2), opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Prisoner1 = Son11) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), opposite(Father1,Father2), un_opposite(Mother1,Mother2), Father1 = Son11) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), opposite(Mother1,Mother2), Mother1 = Son11) 
	),
	Son11 = Boat1,opposite(Son11,Son12).
	
move(state(Police1,Prisoner1,Father1,Mother1,Son1,Son21,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner2,Father2,Mother2,Son1,Son22,Daughter1,Daughter2,Boat2)) :-
	 opposite(Boat1,Boat2),
	 (
		(opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Police1 = Son21) ;
		(un_opposite(Police1,Police2), opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Prisoner1 = Son21) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), opposite(Father1,Father2), un_opposite(Mother1,Mother2), Father1 = Son21) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), opposite(Mother1,Mother2), Mother1 = Son21) 
	),
	Son21 = Boat1,opposite(Son21,Son22).
	
move(state(Police1,Prisoner1,Father1,Mother1,Son1,Son2,Daughter11,Daughter2,Boat1),
	 state(Police2,Prisoner2,Father2,Mother2,Son1,Son2,Daughter12,Daughter2,Boat2)) :-
	 opposite(Boat1,Boat2),
	 (
		(opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Police1 = Daughter11) ;
		(un_opposite(Police1,Police2), opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Prisoner1 = Daughter11) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), opposite(Father1,Father2), un_opposite(Mother1,Mother2), Father1 = Daughter11) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), opposite(Mother1,Mother2), Mother1 = Daughter11) 
	),
	Daughter11 = Boat1, opposite(Daughter11,Daughter12).
	
move(state(Police1,Prisoner1,Father1,Mother1,Son1,Son2,Daughter1,Daughter21,Boat1),
	 state(Police2,Prisoner2,Father2,Mother2,Son1,Son2,Daughter1,Daughter22,Boat2)) :-
	 opposite(Boat1,Boat2),
	 (
		(opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Police1 = Daughter21) ;
		(un_opposite(Police1,Police2), opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), un_opposite(Mother1,Mother2), Prisoner1 = Daughter21) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), opposite(Father1,Father2), un_opposite(Mother1,Mother2), Father1 = Daughter21) ;
		(un_opposite(Police1,Police2), un_opposite(Prisoner1,Prisoner2), un_opposite(Father1,Father2), opposite(Mother1,Mother2), Mother1 = Daughter21) 
	),
	Daughter21 = Boat1,opposite(Daughter21,Daughter22).
		
move(state(Police1,Prisoner1,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner2,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Police1 = Prisoner1, Police1 = Boat1,
	 opposite(Police1,Police2),opposite(Prisoner1,Prisoner2),opposite(Boat1,Boat2).

move(state(Police1,Prisoner,Father1,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner,Father2,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Police1 = Father1, Police1 = Boat1,
	 opposite(Police1,Police2),opposite(Father1,Father2),opposite(Boat1,Boat2).

move(state(Police1,Prisoner,Father,Mother1,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police2,Prisoner,Father,Mother2,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Police1 = Mother1, Police1 = Boat1,
	 opposite(Police1,Police2),opposite(Mother1,Mother2),opposite(Boat1,Boat2).
	 
move(state(Police,Prisoner1,Father1,Mother,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner2,Father2,Mother,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Prisoner1 = Father1, Prisoner1 = Boat1,
	 opposite(Prisoner1,Prisoner2),opposite(Father1,Father2),opposite(Boat1,Boat2).

move(state(Police,Prisoner1,Father,Mother1,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner2,Father,Mother2,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Prisoner1 = Mother1, Prisoner1 = Boat1,
	 opposite(Prisoner1,Prisoner2),opposite(Mother1,Mother2),opposite(Boat1,Boat2).
	 
move(state(Police,Prisoner,Father1,Mother1,Son1,Son2,Daughter1,Daughter2,Boat1),
	 state(Police,Prisoner,Father2,Mother2,Son1,Son2,Daughter1,Daughter2,Boat2)) :-
	 Father1 = Mother1, Father1 = Boat1,
	 opposite(Father1,Father2),opposite(Mother1,Mother2),opposite(Boat1,Boat2).
	 
dfs(Current, Current, CurPath, CurPath).

dfs(Current, Target, CurPath, ResPath) :-
  move(Current, New),
  \+ unsafe(New),
  \+ memberchk(New, CurPath),
  dfs(New, Target, [New|CurPath], ResPath).
  
%solve(Path) :-
solve:-
  Start = state(left,left,left,left,left,left,left,left,left),
  Finish = state(right,right,right,right,right,right,right,right,right),
  dfs(Start, Finish, [Start], Path),!,
  printPath(Path).
  
printPath([]). 
printPath([H|T]) :-
  printPath(T),
  write(H), nl.

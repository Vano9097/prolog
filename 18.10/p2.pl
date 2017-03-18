% state(Police,Prisoner,Father,Mother,Son1,Son2,Daughter1,Daughter2,Boat)


check1(Lst) :- 
  (memberchk(a, Lst), memberchk(d, Lst) )-> (\+ memberchk(b, Lst));true.

check2(Lst) :- 

  (memberchk(a, Lst), \+ memberchk(d, Lst)) -> (memberchk(b, Lst), \+ memberchk(v, Lst));true.

check3(Lst) :- 

  (memberchk(a, Lst)) -> (\+ memberchk(v, Lst));(\+ memberchk(a, Lst)) -> (memberchk(v, Lst)).

check4(Lst) :- 
  (memberchk(d, Lst))-> (\+ memberchk(g, Lst));true.

check5(Lst) :- 
  (\+ memberchk(b, Lst), \+ memberchk(v, Lst) )-> (memberchk(d, Lst));true.
  
check6(Lst) :- 

  (memberchk(v, Lst), \+ memberchk(b, Lst)) -> (memberchk(g, Lst), \+ memberchk(d, Lst));true.

solve(Res) :-
  sublist(Res, [a, b, d, v, g]),
  check1(Res),
  check2(Res),
  check3(Res),
  check4(Res),
  check5(Res),
  check6(Res).



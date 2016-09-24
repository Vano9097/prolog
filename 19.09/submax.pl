max_sub_list([H|T],Lst2) :- iter(T,[H],[],Max), Max = Lst2.

iter([H|T],[SubH|SubT],SubMax,Rez) :-    H > SubH, iter(T,[H|[SubH|SubT]],SubMax,Rez). 
iter([H|T],[SubH|SubT],SubMax,Rez) :- \+ H > SubH, length([SubH|SubT],SubL), length(SubMax,MaxL), SubL > MaxL, iter(T,[H],[SubH|SubT],Rez). 
iter([H|T],[SubH|SubT],SubMax,Rez) :- \+ H > SubH, length([SubH|SubT],SubL), length(SubMax,MaxL), SubL < MaxL, iter(T,[H], SubMax,Rez).
iter([H|T],[SubH|SubT],SubMax,Rez) :- \+ H > SubH, length([SubH|SubT],SubL), length(SubMax,MaxL), SubL = MaxL, iter(T,[H],[SubH|SubT],Rez).  
iter([H|T],[SubH|SubT],SubMax,Rez) :- \+ H > SubH, length([SubH|SubT],SubL), length(SubMax,MaxL), SubL = MaxL, iter(T,[H],SubMax,Rez). 


iter([],Sub,SubMax,Rez) :-  length(Sub,SubL), length(SubMax,MaxL), SubL > MaxL, reverse(Sub,Rez). 
iter([],Sub,SubMax,Rez) :-  length(Sub,SubL), length(SubMax,MaxL), SubL < MaxL, reverse(SubMax,Rez).
iter([],Sub,SubMax,Rez) :-  length(Sub,SubL), length(SubMax,MaxL), SubL = MaxL, reverse(SubMax,Rez).  
iter([],Sub,SubMax,Rez) :-  length(Sub,SubL), length(SubMax,MaxL), SubL = MaxL, reverse(Sub,Rez).

cat(fantic).
cat(druzok).
cat(elisej).
cat(myrlika).

color(orange).
color(white).
color(black).
color(grey).

get_res(Res) :- 
		cat(MiCat),cat(MaCat),cat(LCat),cat(DCat),
		\+ MiCat = MaCat, \+ MiCat = LCat, \+ MiCat = DCat,
		\+ MaCat = LCat, \+ MaCat = DCat,
		\+ LCat = DCat, 
		
		color(MiC),color(MaC),color(LC),color(DC),
		\+ MiC = MaC, \+ MiC = LC, \+ MiC = DC,
		\+ MaC = LC, \+ MaC = DC,
		\+ LC = DC, 
		Res = [[misha,MiCat,MiC]  , 
		[maksim,MaCat,MaC] , 
		[leny,LCat,LC]    ,
		[dima,DCat,DC]].

ytv1(Lst):- memberchk([_,fantic,Color1],Lst), \+ Color1 = orange,memberchk([_,myrlika,Color2],Lst), \+ Color2 = grey.
ytv2(Lst):- memberchk([_,druzok,Color1],Lst),\+ Color1 = white,memberchk([_,elisej,Color2],Lst), \+ Color2 = grey.
ytv3(Lst):- memberchk([misha,_,black],Lst),memberchk([maksim,myrlika,_],Lst).
ytv4(Lst):- memberchk([lena,elisej,_],Lst),memberchk([dima,_,white],Lst).
ytv5(Lst):- memberchk([dima,Cat1,_],Lst), \+ Cat1 = fantic,memberchk([_,druzok,Color2],Lst), \+ Color2 = grey.


solve1(Res):-
get_res(Res),
\+ ytv1(Res),
ytv2(Res),
ytv3(Res),
ytv4(Res),
ytv5(Res).



solve2(Res):-
get_res(Res),
ytv1(Res),
\+ ytv2(Res),
ytv3(Res),
ytv4(Res),
ytv5(Res).


solve3(Res):-
get_res(Res),
ytv1(Res),
ytv2(Res),
\+ ytv3(Res),
ytv4(Res),
ytv5(Res).


solve4(Res):-
get_res(Res),
ytv1(Res),
ytv2(Res),
ytv3(Res),
\+ ytv4(Res),
ytv5(Res).


solve5(Res):-
get_res(Res),
ytv1(Res),
ytv2(Res),
ytv3(Res),
ytv4(Res),
\+ ytv5(Res).

solve(Res) :- setof(R,(solve1(R);solve2(R);solve3(R);solve4(R);solve5(R)),Re ), nth(_,Re,Res).

color(r).
color(s).
color(b).
color(ch).

cat(f).
cat(e).
cat(d).
cat(m).

boy(misha).
boy(maksim).
boy(leny).
boy(dima).

boy_and_cat(B,C):- boy(B),cat(C).
cat_color(Cat,Color) :- cat(Cat), color(Color).
boy_color(B,C) :- boy_and_cat(B,Cat), cat_color(Cat,C).

task1 :- (cat_color(f,C1) -> \+ C1 = r),
		 (cat_color(m,C2) -> \+ C2 = s).

solve([[misha,MiCat,MiC]  , 
       [maksim,MaCat,MaC] , 
       [leny,LCat,LC]]    ,
       [dima,DCat,DC]] ) :-
	
	

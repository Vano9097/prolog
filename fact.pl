fact(X, F) :- 
    ( X=0, F=1; 
      Y is X-1, fact(Y, Z), F is X*Z), 
    write(X), write('! = '), write(F), nl.
	
	

delit(X,Y) :- Z is Y mod X, Z =:= 0.

chet(X) :- delit(2,X).
	
dfact(X,F) :- (X = 1, F = 1); (X = 2, F = 2); (chet(X), 
	
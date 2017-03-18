% Антон, Борис и Владимир играли в футбол и нечаянно
% разбили окно в учительской. Пошло дознание
% А: Это не я. Это Боря.
% Б: Это не я. Это Антон.
% В: Это не я. Это не Боря.
% Известно, что каждый из мальчиков один раз сказал правду,
% а один раз солгал. Кто виновен?

% Цель - список виновных: anton, boris, vova
antonSais(Lst) :- 
  \+ memberchk(anton, Lst), \+ memberchk(boris, Lst) ;
  memberchk(anton, Lst), memberchk(boris, Lst).
borisSais(Lst) :-   
  \+ memberchk(boris, Lst), \+ memberchk(anton, Lst) ;
  memberchk(boris, Lst), memberchk(anton, Lst).
vovaSais(Lst) :-   
  \+ memberchk(vova, Lst), memberchk(boris, Lst) ;
  memberchk(vova, Lst), \+ memberchk(boris, Lst).
  
solve(Res) :-
  sublist(Res, [anton, boris, vova]),
  antonSais(Res),
  borisSais(Res),
  vovaSais(Res).
  
% Раставить в формуле 1?(2?(3?(4?(5?6)))) вместо
% вопросов знаки арифмет. операций +, -, *,
% чтобы в результате получилось 35

formula(F,Res) :-   % F - результирующая формула
  Ops = [+,-,*],
  member(Op1, Ops),
  member(Op2, Ops),
  member(Op3, Ops),
  member(Op4, Ops),
  member(Op5, Ops),
  F1 =.. [Op1,5,6],
  F2 =.. [Op2,4,F1],
  F3 =.. [Op3,3,F2],
  F4 =.. [Op4,2,F3],
  F =.. [Op5,1,F4],
  F =:= Res.


% Три девочки, Аня, Валя и Галя, пошли гулять.
% У них есть три копмлекта одежды - платья и туфли,
% красного, зеленого и синего цвета.
% При этом, 
%    (1) на Ане нет синего, 
%    (2) у Вали красные туфли,
%    (3) у Гали платье того же цвета, что Ани туфли
% Как одеты девочки?

color(red).
color(green).
color(blue).
% перебор организуется запросом color(X).

solveG3([ [anya,ADress,AShoes], 
        [valya,VDress,VShoes], 
        [galya,GDress,GShoes] ]) :-
  color(ADress), color(AShoes),
  color(VDress), color(VShoes),
  color(GDress), color(GShoes),  
%  (1)
  ADress \= blue, AShoes \= blue,
%  (2)
  VDress \= ADress, VShoes \= AShoes,
  VShoes = red,
%  (3)
  GDress \= ADress, GShoes \= AShoes,
  GDress \= VDress, GShoes \= VShoes,
  GDress = AShoes.
  
  
solveG2([ [anya,ADress,AShoes], 
        [valya,VDress,VShoes], 
        [galya,GDress,GShoes] ]) :-
  
%  (1)
  color(ADress), ADress \= blue, 
  color(AShoes), AShoes \= blue,
%  (2)
  color(VDress), VDress \= ADress, 
  VShoes = red,  VShoes \= AShoes,
%  (3)
  color(GDress), GDress \= ADress, GDress \= VDress, 
                 GDress = AShoes,
  color(GShoes), GShoes \= AShoes, GShoes \= VShoes.
  
  
% Крестьянин, капуста, коза, волк
% Лодка: крестьянин + еще один объект
% Нельзя осталвялть на берегу без крестьянина
%   - капусту с козой
%   - козу с волком

% state(P,C,G,W) - вершина в графе
%    P,C,G,W = left,right

opposite(left,right).
opposite(right,left).

unsafe(state(P,C,G,_)) :- C = G, opposite(P,C).
unsafe(state(P,_,G,W)) :- G = W, opposite(P,G).

% Задаю состояние Old, хочу получить все
% состояния New, в которые могу перейти
% move(Old,New)

% Возможность переезда 1: переехал крестьянин
move(state(P1,C,G,W), state(P2,C,G,W)) :-
  opposite(P1,P2).
  
% Возможность переезда 2: переехал крестьянин и капуста
move(state(P1,C1,G,W), state(P2,C2,G,W)) :-
  P1 = C1, opposite(P1,P2), opposite(C1,C2).
  
% Возможность переезда 3: переехал крестьянин и коза
move(state(P1,C,G1,W), state(P2,C,G2,W)) :-
  P1 = G1, opposite(P1,P2), opposite(G1,G2).
  
% Возможность переезда 4: переехал крестьянин и волк
move(state(P1,C,G,W1), state(P2,C,G,W2)) :-
  P1 = W1, opposite(P1,P2), opposite(W1,W2).
  
% dps(Current,Target,CurPath,ResPath)  
%   Current - текущее состояние
%   Target - целевое состояние
%   CurPath - накопленный путь
%   ResPath - ответ (выходной параметр)  

dfs(Current, Current, CurPath, CurPath).

dfs(Current, Target, CurPath, ResPath) :-
  move(Current, New),
  \+ unsafe(New),
  \+ member(New, CurPath),
  dfs(New, Target, [New|CurPath], ResPath).
  
%solve(Path) :-
solveState :-
  Start = state(left,left,left,left),
  Finish = state(right,right,right,right),
  dfs(Start, Finish, [Start], Path),
  printPath(Path).
  
printPath([]). 
printPath([H|T]) :-
  printPath(T),
  write(H), nl.

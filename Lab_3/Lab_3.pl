%Exercise 1
max(X,Y,X):-X>Y.
max(_,Y,Y).

%Exercise 2
max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

%Exercise 3
fact_up(0,1):-!.
fact_up(X,Y):-X1 is X-1,fact_up(X1,Y1),Y is X*Y1.

%Exercise 4
fact_d(X,Y,X,Y):-!.
fact_d(X,Y,X1,Y1):-X2 is X1+1,Y2 is Y1*X2,fact_d(X,Y,X2,Y2).
fact_down(X,Y):-fact_d(X,Y,1,1).

%Exercise 5
fib_up(2,1):-!.
fib_up(X,Y):-X1 is X-1, fibUp(X1,Y1), Y is Y+Y1.

%Exercise 6
fib_d(2,_,NextX,NextX):-!.
fib_d(N,LastX,NextX,X):-N1 is N-1, NextX1 is LastX+NextX, fibD(N1,NextX,NextX1,X).
fib_down(N,X):-fibD(N,1,1,X).

%Exercise 7
sum_num_up(0,0):-!.
sum_num_up(X,Sum):-X1 is X div 10, sum_num_up(X1,S1), Sum is S1 + X mod 10.

%Exercise 8
sum_num_d(0,S,S):-!.
sum_num_d(X,VS,S):-X1 is X div 10, VS1 is VS + X mod 10,sum_num_d(X1,VS1,S).
sum_num_down(X,S):-sum_num_d(X,0,S).

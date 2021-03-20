max(X,Y,X):-X>Y.
max(_,Y,Y).

max(X,Y,Z,X):-X>=Y,X>=Z,!.
max(_,Y,Z,Y):-Y>=Z,!.
max(_,_,Z,Z):-!.

fact_up(0,1):-!.
fact_up(X,Y):-X1 is X-1,fact_up(X1,Y1),Y is X*Y1.

fact_d(X,Y,X,Y):-!.
fact_d(X,Y,X1,Y1):-X2 is X1+1,Y2 is Y1*X2,fact_d(X,Y,X2,Y2).
fact_down(X,Y):-fact_d(X,Y,1,1).

fib_up(2,1):-!.
fib_up(X,Y):-X1 is X-1, fibUp(X1,Y1), Y is Y+Y1.

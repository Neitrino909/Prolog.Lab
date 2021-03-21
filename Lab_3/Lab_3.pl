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
fib_up(X,Y):-X1 is X-1, fib_Up(X1,Y1), Y is Y+Y1.

%Exercise 6
fib_d(2,_,NextX,NextX):-!.
fib_d(N,LastX,NextX,X):-N1 is N-1, NextX1 is LastX+NextX, fib_d(N1,NextX,NextX1,X).
fib_down(N,X):-fib_d(N,1,1,X).

%Exercise 7
sum_num_up(0,0):-!.
sum_num_up(X,Sum):-X1 is X div 10, sum_num_up(X1,S1), Sum is S1 + X mod 10.

%Exercise 8
sum_num_d(0,S,S):-!.
sum_num_d(X,VS,S):-X1 is X div 10, VS1 is VS + X mod 10,sum_num_d(X1,VS1,S).
sum_num_down(X,S):-sum_num_d(X,0,S).

%Exercise 9
mult_num_up(0,1):-!.
mult_num_up(X,Y):-X1 is X div 10, mult_num_up(X1,Y1), Y is Y1 * (X mod 10).

%Exercise 10
mult_num_d(0,M,M):-!.
mult_num_d(X,VS,M):-X1 is X div 10, VS1 is VS * (X mod 10), mult_num_d(X1,VS1,M).
mult_num_down(X,M):-mult_num_d(X,1,M).

%Exercise 11.1
not3(X,X):- X mod 3 =\= 0,!.
not3(_,0):-!.
max_num_not_3_up(0,0):-!.
max_num_not_3_up(X,N):-X1 is X div 10,max_num_not_3_up(X1,N1),!,
    N2 is X mod 10, not3(N2,N3), max(N1,N3,N),!.

%Exercise 11.2
max_num_not_3_down(0,Max,Max):-!.
max_num_not_3_down(X,Max,N):-X1 is X div 10, N1 is X mod 10, not3(N1,N2),
    max(Max,N2,Max1),max_num_not_3_down(X1,Max1,N),!.
max_num_not_3_down(X,N):-max_num_not_3_down(X,0,N).

%Exercise 12
nod(A,A,A) :- !.
nod(A,B,D) :- A>B, !, C is A-B, nod(C,B,D).
nod(A,B,D) :- C is B-A, nod(A,C,D).

% Exercise 1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

r_list(N,N,L,L):-!.
r_list(N,I,VSL,L):-I1 is I+1, read(X),append(VSL,[X],VSL1),r_list(N,I1,VSL1,L).
read_list(N,L):-r_list(N,0,[],L).

% Exercise 2
s_list_D([],Sum,Sum):-!.
s_list_D([H|L],VSSum,Sum):-VSSum1 is VSSum + H, s_list_D(L,VSSum1,Sum).
sum_list_down(List,Sum):-s_list_D(List,0,Sum).

read_sum_write_list(N):-
    read_list(N,L),
    sum_list_down(L,Sum),
    nl, write("Sum = "),write(Sum),nl,fail.
    
% Exercise 3
sum_list_up([],0):-!.
sum_list_up([H|List],Sum):-sum_list_up(List,SumNew),Sum is SumNew + H.

% Exercise 4.1
list_el_numb([H|_],H,0):-!.
list_el_numb([_|List],Elem,Numb):-list_el_numb(List,Elem,NewNumb),Numb is NewNumb+1.

% Exercise 4.2
read__list_el_numb(N):-
    write("List: "),read_list(N,List),nl,
    write("Element: "),read(Elem),nl,
    write("Resul: "),list_el_numb(List,Elem,X),
    write(X),nl,false.

% Exercise 5
read_list_numb_el(N):-
    write("List: "),read_list(N,List),nl,
    write("Element: "),read(Numb),nl,
    write("Result: "),list_el_numb(List,X,Numb),
    write(X),nl,false.

% Exercise 7
min_list_d([],Min,Min):-!.
min_list_d([H|L],VSMin,Min):-min(VSMin,H,NewVSMin),min_list_d(L,NewVSMin,Min).
min_list_down(List,Min):-min_list_d(List,9999,Min).

% Exercise 8
read_min_list(N):-
    write("List: "),read_list(N,List),nl,
    write("Result: "),min_list_up(List,X),
    write(X),nl,false.

% Exercise 9
el_in_list(X,[X,_]):-!.
el_in_list(X,[_|T]):-el_in_list(X,T).

% Exercise 10
rev([],X,X):-!.
rev([H|T],VSL,X):-rev(T,[H|VSL],X).
reverse(L,X):-rev(L,[],X).

% Exercise 11
order([],[]):-!.
order([HS|Sublist],[HL|List]):-p(Sublist,List),HS =:= HL.

% Exercise 12
del_by_num([_|T],0,T):-!.
del_by_num([H|T],N,[H|T1]):-N1 is N-1,del_by_num(T,N1,T1).

% Exercise 13
del_repeat([],_,[]):-!.
del_repeat([H|T],El,[H|T1]):-H=\=El,del_repeat(T,El,T1),!.
del_repeat([_|T],El,T1):-del_repeat(T,El,T1).

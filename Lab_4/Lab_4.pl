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

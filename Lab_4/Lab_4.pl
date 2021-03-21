% Exercise 1
writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

r_list(N,N,L,L):-!.
r_list(N,I,VSL,L):-I1 is I+1, read(X),append(VSL,[X],VSL1),r_list(N,I1,VSL1,L).
read_list(N,L):-r_list(N,0,[],L).

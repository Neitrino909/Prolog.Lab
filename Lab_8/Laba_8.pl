in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

read_str(A,N):- get0(X), r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):- K1 is K+1, append(B,[X],B1), get0(X1), r_str(X1,A,B1,N,K1).

write_list([]):-!.
write_list([Head|Tail]):- write(Head), write_list(Tail).

write_str([]):-!.
write_str([H|Tail]):- put(H), write_str(Tail).

% 1_1
upr1_1:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), build_all_razm_p, told.
build_all_razm_p:- read_str(A,_), read(K), b_a_rp(A,K,[]).

b_a_rp(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_rp(A,N,Perm):- in_list(A,El), N1 is N-1, b_a_rp(A,N1,[El|Perm]).

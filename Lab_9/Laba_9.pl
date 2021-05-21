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

% 1_2
upr1_2:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), build_all_perm, told.
build_all_perm:- read_str(A,_), b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):- in_list_exlude(T,El,Tail).

b_a_p([],Perm1):- write_str(Perm1), nl, !, fail.
b_a_p(A,Perm):- in_list_exlude(A,El,A1), b_a_p(A1,[El|Perm]).

% 1_3
upr1_3:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), build_all_razm, told.
build_all_razm:- read_str(A,_), read(K), b_a_r(A,K,[]).
		
b_a_r(_,0,Perm1):- write_str(Perm1), nl, !, fail.
b_a_r(A,N,Perm):- in_list_exlude(A,El,A1), N1 is N-1, b_a_r(A1,N1,[El|Perm]).

% 1_4
upr1_4:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), pr_subset, told.
pr_subset:- read_str(A,_), sub_set(B,A), write_str(B), nl, fail.

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):- sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):- sub_set(Sub_set,Set).

% 1_5
upr1_5:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), pr_sochet, told.
pr_sochet:- read_str(A,_), read(K), sochet(B,K,A), write_str(B), nl, fail.
sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):- sochet(Sub_set,K,Set).

% 1_6
upr1_6:- tell('c:/Users/Neutrino/Desktop/p1_out.txt'), pr_sochet_p, told.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):- K1 is K-1, sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):- sochet_p(Sub_set,K,Set).
pr_sochet_p:- read_str(A,_), read(K), sochet_p(B,K,A), write_str(B), nl, fail.

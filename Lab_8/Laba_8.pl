write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

% 1_1
upr1_1:- see('c:/Users/Neutrino/Desktop/p1_in.txt'), read_list_str(_, LengthList),
	seen, max(LengthList, Max), write(Max).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

% 1_2
upr1_2:- see('c:/Users/Neutrino/Desktop/p1_in.txt'), read_list_str_space(_, C),
	seen, write("C = "), write(C).

read_str_symbol(A,Count,S,Flag):- get0(X), r_str_symbol(X,A,[],Count,0,S,Flag).
r_str_symbol(-1,A,A,Count,Count,_,1):-!.
r_str_symbol(10,A,A,Count,Count,_,0):-!.
r_str_symbol(X,A,B,Count,C,S,Flag):- append(B,[X],B1), get0(X1),
	(X = S -> C1 is C+1; C1 is C), r_str_symbol(X1,A,B1,Count,C1,S,Flag).

read_list_str_space(List, C):- read_str_symbol(A,Count,32,Flag),
	(Count = 0 -> C1 = 1; C1 = 0), read_list_str_space([A],List,C1,C,Flag).

read_list_str_space(List,List,C,C,1):-!.

read_list_str_space(Cur_list,List,CurC,C,0):-
	read_str_symbol(A,Count,32,Flag), append(Cur_list,[A],C_l),
	(Count = 0 -> C1 is CurC+1; C1 is CurC),
	read_list_str_space(C_l,List,C1,C,Flag).

% 1_3
upr1_3:- see('c:/Users/Neutrino/Desktop/p1_in.txt'), count_A(_,N,C), M is C/N,
	 seen, see('c:/Users/Neutrino/Desktop/p1_in.txt'), read_list_str_A(_,M), seen.

count_A(List,N,C):- read_str_symbol(_,Count,65,Flag),
	N1 = 1, count_A(List,N1,N,Count,C,Flag).
count_A(_,N,N,C,C,1):-!.
count_A(List,CurN,N,CurC,C,0):- read_str_symbol(_,Count,65,Flag),
	C1 is CurC + Count, N1 is CurN + 1,
	count_A(List,N1,N,C1,C,Flag).

read_list_str_A(List, M):- read_str_symbol(A,Count,65,Flag),
	(Count > M -> write_str(A), nl; true), read_list_str_A(List,M,Flag).

read_list_str_A(_,_,1):-!.

read_list_str_A(List,M,0):-
	read_str_symbol(A,Count,65,Flag), (Count > M -> write_str(A),nl; true),
	read_list_str_A(List,M,Flag).

% 1_4
upr1_4:- see('c:/Users/Neutrino/Desktop/p1_in.txt'), read_list_str1(List), seen,
	freq_word(List,Freq_word), (Freq_word\=[] -> write("Word = "), write_str(Freq_word); false).

read_list_str1(List):- read_str(A,_,Flag), append(A,[32],L),
	read_list_str1(L,List,Flag).
read_list_str1(List,List,1):-!.
read_list_str1(Cur_list,List,0):-
	read_str(A,_,Flag), append(Cur_list,A,C_l), append(C_l,[32],L),
	read_list_str1(L,List,Flag).

in_list([El|_],El):-!.
in_list([_|T],El):-in_list(T,El).

.

get_word([],[]):- !.
get_word([32|_],[]):- !.
get_word([H|T1],[H|T2]):- H\=32, get_word(T1,T2),!.



num_word([],_,I,I):-!.
num_word([32|T],Word,I,C):- delete_space(T,List),
	num_word(List,Word,I,C), !.
num_word(List,Word,I,C):- get_word(List,W), delete_fword(List,L),
	(W = Word -> I1 is I+1; I1 is I), num_word(L,Word,I1,C).

append_list([],List2,List2).
append_list([H|T1],List2,[H|T2]):- append_list(T1,List2,T2).

delete_space([32|T],List):- delete_space(T,List),!.
delete_space(List,List).


delete_fword([],[]):-!.
delete_fword([H|T1],List):- H\=32, delete_fword(T1,List),!.
delete_fword([32|T],T):-!.



freq_word(List,Freq_word):- delete_space(List,L), append_list(L,[32],Source_list),
	freq_word(Source_list,Source_list,[],0,Freq_word).
freq_word(_,[],Word,_,Word):-!.
freq_word(Source_list,Changing_list,Current_word,Num,Freq_word):-
	get_word(Changing_list,Cur), num_word(Source_list,Cur,0,I),
	delete_fword(Changing_list, List), delete_space(List,Changed_list),
	(I > Num -> freq_word(Source_list,Changed_list,Cur,I,Freq_word);
	freq_word(Source_list,Changed_list,Current_word,Num,Freq_word)).

% 1_5
upr1_5:- see('c:/Users/Neutrino/Desktop/p1_in.txt'), read_list_str1(List), seen,
	unique_words(List,List,[],R), see('c:/Users/Neutrino/Desktop/p1_in.txt'),
	read_list_str2(_,R,ResList), seen, tell('c:/Users/Neutrino/Desktop/p1_out.txt'),
	write_list_str(ResList),told.

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_list_str2(_,UniqList,ResList):- read_str(A,_,Flag), append(A,[32],L),
	(check_unique(L,UniqList) -> read_list_str2([A],UniqList,ResList,Flag);
	read_list_str2([],UniqList,ResList,Flag)).

read_list_str2(List,_,List,1):-!.
read_list_str2(Cur_list,UniqList,List,0):- read_str(A,_,Flag), append(A,[32],L),
	(check_unique(L,UniqList) -> append(Cur_list,[A],C_l); append(Cur_list,[],C_l)),
	read_list_str2(C_l,UniqList,List,Flag).

% Выделяем из списка List все слова, встречающиеся ровно 1 раз.
unique_words(_,[],L,L):-!.
unique_words(List,CurList,L,R):- delete_space(CurList,List1), get_word(List1, Word),
	delete_fword(List1,L2), num_word(List,Word,0,Number),
	(Number = 1 -> append(L,[Word],L1); L1 = L), unique_words(List,L2,L1,R).

% Проверка: состоит ли строка только из уникальных слов.
check_unique([],_):-!.
check_unique(List,UniqList):- delete_space(List,List1), get_word(List1,Word),
	in_list(UniqList,Word), delete_fword(List1,L), check_unique(L,UniqList).

% 2_6
upr2_6:- read_str(List,_,_), append([32],List,L), append(L,[32],L1), count_words(L1,0,C),
	p2_6(L1,C,1,[],ResList), write_str(ResList).

p2_6([],_,_,ResList,ResList):-!.
p2_6(List,C,I,ResList,ResL):- I > 1, I < C, delete_space(List,List1),
	get_word(List1, Word), delete_fword(List1,List2), length(Word,L), Len is L-1,
	shuffle_list(Word,Len,Len,[],[],Res), append(ResList,Res,L1), append(L1,[32],L2),
	I1 is I+1, p2_6(List2,C,I1,L2,ResL),!.
p2_6(List,C,I,ResList,ResL):- delete_space(List,List1), get_word(List1, Word),
	delete_fword(List1,List2), append(ResList,Word,L1), append(L1,[32],L2),
	I1 is I+1, p2_6(List2,C,I1,L2,ResL),!.

shuffle_list(_,_,-1,_,ResList,ResList):-!.
shuffle_list(List,Length,I,NumList,ResList,ResL):- random_between(0,Length,R),
	not(in_list(NumList,R)), I1 is I-1,  list_el_numb(List,Elem,R),
	append(ResList,[Elem],Res), append(NumList,[R],NumL),
	shuffle_list(List,Length,I1,NumL,Res,ResL),!.

shuffle_list(List,Length,I,NumList,ResList,ResL):-
	shuffle_list(List,Length,I,NumList,ResList,ResL).

list_el_numb(List,Elem,Number):- list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):- I1 is I+1, list_el_numb(Tail,Elem,I1,Number).

% В начале строки должен быть пробел.
count_words([],K,K):-!.
count_words([32,H2|T],I,K):- H2\=32, H2\=10, I1 is I+1, count_words(T,I1,K),!.
count_words([_|T],I,K):- count_words(T,I,K),!.

% 2_12
upr2_12:- read_str(A,_), digits(A,D), letters(A,L), append(D,L,List), write_str(List).

digits([],[]):-!.
digits([H|T1],[H|T2]):- H >= 48, H =< 57, digits(T1,T2),!.
digits([_|T],List):- digits(T,List).

letters([],[]):-!.
letters([H|T1],[H|T2]):- H >= 65, H =< 90, letters(T1,T2),!.
letters([H|T1],[H|T2]):- H >= 97, H =< 122, letters(T1,T2),!.
letters([H|T1],[H|T2]):- H >= 1040, H =< 1103, letters(T1,T2),!.
letters([H|T1],[H|T2]):- (H = 1025; H = 1105), letters(T1,T2),!.
letters([_|T],List):- letters(T,List).

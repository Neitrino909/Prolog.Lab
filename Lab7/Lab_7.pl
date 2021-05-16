
% ÷òåíèå ñòðîêè è ïðåîáðàçîâàíèå å¸ â ñïèñîê ASCII êîäîâ ñèìâîëîâ
read_string(10,L,L,N,N):-!.	% 10 - enter
read_string(X,L,CurL,N,CurN):-	NewN is CurN+1,append(CurL,[X],NewL),
				get0(Y),read_string(Y,L,NewL,N,NewN).
read_string(L,N):-	nl,write("input string: "),
			get0(X),read_string(X,L,[],N,0).

% âûâîä ñòðîêè ÷åðåç ñïèñîê ASCII êîäîâ ñèìâîëîâ
write_string([]):-!.
write_string([H|T]):-	put(H),
			write_string(T).

% âûâîä ñòðîêè ÷åðåç ñïèñîê ñïèñêîâ ASCII êîäîâ ñèìâîëîâ
write_strings([]):-!.
write_strings([H|T]):-	write_string(H),nl,
			write_strings(T).

% Çàäàíèå 7.1 - âûâåñòè ñòðîêó òðè ðàçà ÷åðåç çàïÿòóþ,
% ïîêàçàòü êîëè÷åñòâî ñèìâîëîâ â íåé
predicate1:-	read_string(L,N),nl,

		writeln("output string (three times): "),
		write_string(L),write(", "),
		write_string(L),write(", "),
		write_string(L),nl,nl,

		write("string length: "),writeln(N),nl.

% Çàäàíèå 7.2 - íàéòè êîëè÷åñòâî ñëîâ â ñòðîêå
predicate2:-	read_string(L,_),
		count_words(L,Count),
		write("number of words: "),
		writeln(Count),nl.

% ñ÷èòàåò êîëè÷åñòâî ñëîâ â ñòðîêå
count_words([],Count,Count):-!.
count_words(L,Count,CurCount):-	skip_spaces(L,CurL),
				get_word(CurL,NewL,Word),
				Word \= [],
				NewCount is CurCount+1,
				count_words(NewL,Count,NewCount),!.
count_words(_,Count,Count).
count_words(L,Count):-count_words(L,Count,0).

% óáèðàåò ïðîáåëû â íà÷àëå ñòðîêè
skip_spaces([32|T],NewL):-skip_spaces(T,NewL),!.
skip_spaces(L,L).

% âû÷ëåíÿåò ñëîâî â íà÷àëå ñòðîêè
get_word([],[],[]):-!.
get_word(L,NewL,Word):-get_word(L,NewL,Word,[]).

get_word([],[],Word,Word).
get_word([32|T],T,Word,Word):-!.
get_word([H|T],NewL,Word,CurWord):-append(CurWord,[H],NewWord),
                                   get_word(T,NewL,Word,NewWord).



% Задание 7.3 - определить самое встречаемое слово
predicate3:-	read_string(L,_),

		get_words(L,Words,_),
		unique_list(Words,UniqueW),

		count_reps(UniqueW,Counts,Words),
		max_list_down(Counts,MaxC),

		list_el_numb(Counts,MaxC,Index),
		list_el_numb(UniqueW,MaxW,Index),

		nl,writeln("*if the frequency of occurrence is repeated,*"),
		writeln("*the first word is output*"),

		nl,write("the most common word: "),write_string(MaxW),nl,
		write("frequency of occurrance: "),writeln(MaxC),nl.

% собирает список из слов
get_words([],Words,Words,C,C):-!.
get_words(L,Words,CurWords,C,CurC):-	skip_spaces(L,CurL),
					get_word(CurL,NewL,Word),
					Word \=[],
					NewC is CurC+1,
					append(CurWords,[Word],NewWords),
					get_words(NewL,Words,NewWords,C,NewC),!.
get_words(_,Words,Words,C,C).
get_words(L,Words,Count):-get_words(L,Words,[],Count,0).

% считает количество вхождений элементов из одного списка в другой список
count_reps([],[],_):-!.
count_reps([Word|T],Counts,Words):-	count_reps(T,CurCounts,Words),
					number_times(Words,Count,Word),
					append([Count],CurCounts,Counts).

% task 7.4 - вывести первые три символа и последние три символа, 
% если длина строки больше 5, иначе - вывести первый символ
% столько раз, какова длина строки
predicate4:-	read_string(L,Length),
		write("string length: "),write(Length),nl,

		(Length>5 -> Index is Length-3,

		build_list(L,CurL1,4),
		build_list_after(L,CurL2,Index),

		nl,write("first three characters: "),write_string(CurL1),
		nl,write("last three characters: "),write_string(CurL2),nl,nl;

		L \= [],
		list_el_numb(L,First,1),
		build_reps(Length,First,RepsL),

		nl,writeln("repeated first character,"),
		write("number of reps is equal to the length: "),
		write_string(RepsL),nl,nl).

% создает список, состоящий из одного элемента заданное количество раз
build_reps(0,_,L,L):-!.
build_reps(N,X,L,CurL):-	CurN is N-1,
				append(CurL,[X],NewL),
				build_reps(CurN,X,L,NewL).
build_reps(N,X,L):-build_reps(N,X,L,[]).

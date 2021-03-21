writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

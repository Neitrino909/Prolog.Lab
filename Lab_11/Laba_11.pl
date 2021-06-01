:-dynamic genre/2,continuation/2,age/2,autor/2,hero/2,nationality/2.

read_str(A) :-get0(X),r_str(X, A, []).
r_str(10, A, A) :- !.
r_str(X, A, B) :-append(B, [X], B1),get0(X1),r_str(X1, A, B1).

genre_r(X,Y):-repeat,(genre(X,Y)->(nl,write(X),nl,write(Y),write("."),retract(genre(X,Y)));X=nil,Y=nil).
continuation_r(X,Y):-repeat,(continuation(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(continuation(X,Y)));X=nil,Y=nil).
age_r(X,Y):-repeat,(age(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(age(X,Y)));X=nil,Y=nil).
autor_r(X,Y):-repeat,(autor(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(autor(X,Y)));X=nil,Y=nil).
hero_r(X,Y):-repeat,(hero(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(hero(X,Y)));X=nil,Y=nil).
nationality_r(X,Y):-repeat,(nationality(X,Y) -> (nl,write(X),nl,write(Y),write("."),retract(nationality(X,Y)));X=nil,Y=nil).

prTell:-tell('C:/Users/Пользователь/Documents/Lab11/1.txt'),genre_r(X1,_),X1=nil,told,
     tell('C:/Users/Пользователь/Documents/Lab11/2.txt'),continuation_r(X2,_),X2=nil,told,
     tell('C:/Users/Пользователь/Documents/Lab11/3.txt'),age_r(X3,_),X3=nil,told,
     tell('C:/Users/Пользователь/Documents/Lab11/4.txt'),autor_r(X4,_),X4=nil,told,
     tell('C:/Users/Пользователь/Documents/Lab11/5.txt'),hero_r(X5,_),X5=nil,told,
     tell('C:/Users/Пользователь/Documents/Lab11/6.txt'),nationality_r(X6,_),X6=nil,told.

prSee:-see('C:/Users/Пользователь/Documents/Lab11/1.txt'), get0(Sym1), read_data(Sym1,1), seen,
     see('C:/Users/Пользователь/Documents/Lab11/2.txt'), get0(Sym2), read_data(Sym2,2), seen,
     see('C:/Users/Пользователь/Documents/Lab11/3.txt'), get0(Sym3), read_data(Sym3,3), seen,
     see('C:/Users/Пользователь/Documents/Lab11/4.txt'), get0(Sym4), read_data(Sym4,4), seen,
     see('C:/Users/Пользователь/Documents/Lab11/5.txt'), get0(Sym5), read_data(Sym5,5), seen,
     see('C:/Users/Пользователь/Documents/Lab11/6.txt'), get0(Sym6), read_data(Sym6,6), seen.

read_data(-1, _) :- !.
read_data(_, Flag) :-read_str(Lang),name(X, Lang),read(Y),
            (
              Flag = 1 ->asserta(genre(X, Y));
            (
              Flag = 2 ->asserta(continuation(X, Y));
            (
              Flag = 3 ->asserta(age(X, Y));
            (
              Flag = 4 ->asserta(autor(X, Y));
            (
              Flag = 5 ->asserta(hero(X, Y));
            (
              Flag = 6 ->asserta(nationality(X, Y)))))))),

         get0(Sym),
         read_data(Sym, Flag).

question1(X1):-write("What genre is the book?"),nl,
             write("0 - Fantasi"),nl,
             write("1 - Fantastika"),nl,
             write("2 - Roman"),nl,
             write("3 - detective"),nl,
             read(X1).

question2(X2):-write("Does this book have a sequel?"),nl,
               write("0 - No"),nl,
               write("1 - Yes"),nl,
               read(X2).

question3(X3):-write("Is this a book for children?"),nl,
               write("0 - No"),nl,
               write("1 - Yes"),nl,
               read(X3).

question4(X4):-write("The author is a man?"),nl,
               write("0 - No"),nl,
               write("1 - Yes"),nl,
               read(X4).

question5(X5):-write("Does your book have one main character?"),nl,
               write("0 - No"),nl,
               write("1 - Yes"),nl,
               read(X5).

question6(X6):-write("The author of the book from Russia?"),nl,
               write("0 - No"),nl,
               write("1 - Yes"),nl,
               read(X6).



pr :-prSee,question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
        question6(X6),
        (genre(X,X1),continuation(X,X2),age(X,X3),autor(X,X4),hero(X,X5),nationality(X,X6),write(X);
         (write("New -> "),
          read(Auto),
          asserta(genre(Auto, X1)),
          asserta(continuation(Auto, X2)),
          asserta(age(Auto, X3)),
          asserta(autor(Auto, X4)),
          asserta(hero(Auto, X5)),
          asserta(nationality(Auto, X1)),
          prTell,nl,
          write("New was added!"))).

man(mango).
man(bango).
man(longo).
man(bingo).
man(rudigar).
man(bodo).
man(bilbo).
man(oto).
man(odo).
man(olo).
man(sancho).
man(falko).
man(ponto).
man(togo).

woman(laura).
woman(belba).
woman(linda).
woman(beladonna).
woman(kamilia).
woman(chika).
woman(poppi).
woman(mimoza).
woman(lili).

parent(mango,bango).
parent(mango,belba).
parent(mango,longo).
parent(mango,linda).
parent(mango,bingo).

parent(laura,bango).
parent(laura,belba).
parent(laura,longo).
parent(laura,linda).
parent(laura,bingo).

parent(ponto,beladonna).
parent(ponto,bodo).
parent(ponto,rudigar).

parent(mimoza,beladonna).
parent(mimoza,bodo).
parent(mimoza,rudigar).

parent(togo,kamilia).
parent(togo,chika).

parent(lili,kamilia).
parent(lili,chika).


parent(bango,bilbo).

parent(beladonna,bilbo).

parent(longo,oto).

parent(kamilia,oto).

parent(linda,odo).
parent(linda,olo).
parent(linda,sancho).

parent(bodo,odo).
parent(bodo,olo).
parent(bodo,sancho).

parent(bingo,falko).
parent(bingo,poppi).

parent(chika,falko).
parent(chika,poppi).

all_man(X):-man(X),write(X),nl,fail.
all_woman(X):-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl ,fail.

mother(X,Y):-woman(X),parent(X,Y),write("��������"),nl ,fail.
mother(X):-woman(Y),parent(Y,X),write(Y),nl ,fail.

father(X,Y):-man(X),parent(X,Y),write("��������"),nl ,fail.
father(X):-man(Y),parent(Y,X),write(Y),nl ,fail.

brother(X,Y):-man(X),parent(Z,X),parent(Z,Y),write("��������"),!,nl,fail.
brothers(X):-parent(Z,X),parent(Z,Y),man(Y),man(Z),dif(X,Y),write(Y),nl,fail.

wife(X,Y):-woman(X),parent(X,Z),parent(Y,Z),write("��������"),!,nl,fail.
wife(X):-woman(Y),parent(X,Z),parent(Y,Z),write(Y),!,nl,fail.

b_s(X,Y):-parent(Z,X),parent(Z,Y),write("��������"),!,nl,fail.
b_s(X):-parent(Z,X),parent(Z,Y),woman(Z),not(X=Y),write(Y),nl,fail.

grand_pa(X,Y):-man(X),parent(X,Z),parent(Z,Y),write("��������"),nl,fail.
grand_pas(X):-man(Y),parent(Z,X),parent(Y,Z),write(Y),nl,fail.

grand_ma(X,Y):-woman(X),parent(X,Z),parent(Z,Y),write("��������"),nl,fail.
grand_mas(X):-woman(Y),parent(Z,X),parent(Y,Z),write(Y),nl,fail.

grand_pa_and_son(X,Y):-(parent(X,Z),parent(Z,Y),man(X))\=(parent(Z,X),parent(Z,Y)),man(X),man(Y),write("��������"),nl,fail.

grand_ma_and_son(X,Y):-parent(Z,Y),parent(X,Z),mother(X,Z),man(Y);parent(Z,X),mother(Y,Z),man(X).

uncle(X,Y):-parent(R,H),parent(H,Y),parent(R,X),X\=H,man(X),man(R).
uncles(X):-uncle(Y,X),write(Y),write(", "),fail.

nephew(X,Y):-parent(R,H),parent(H,X),parent(R,Y),Y\=H ,man(Y),man(X),man(R).
nephew(X):-nephew(Y,X),write(Y),write(", "),fail.

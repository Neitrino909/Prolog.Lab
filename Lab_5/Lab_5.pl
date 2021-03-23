%Exercise 1
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

right_next(A,B,[C]):-fail.
right_next(A,B,[A|[B|Tail]]).
right_next(A,B,[_|List]):-right_next(A,B,List).

left_next(A,B,[C]):-fail.
left_next(A,B,[B|[A|Tail]]).
left_next(A,B,[_|List]):-left_next(A,B,List).

next_to(A,B,List):-right_next(A,B,List).
next_to(A,B,List):-left_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_Houses:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		right_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),

		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),

		write(Houses),
		nl,write(WHO1),write("-Water"),nl,write(WHO2),write("-Zebra").

%Exercise 2
tree_friends:-Friends=[_,_,_],
    in_list(Friends,[belokurov,_]),
    in_list(Friends,[ryzhov,_]),
    in_list(Friends,[chernov,_]),
    in_list(Friends,[_,blondin]),
    in_list(Friends,[_,ryzhiy]),
    in_list(Friends,[_,brunet]),

    not(in_list(Friends,[belokurov,blondin])),
    not(in_list(Friends,[ryzhov,ryzhiy])),
    not(in_list(Friends,[chernov,brunet])),
    not(in_list(Friends,[belokurov,brunet])),

    write(Friends),!.

%Exercise 3
tree_girlfriends:-Gerlfriends=[_,_,_],

    in_list(Gerlfriends,[_,white,_]),
    in_list(Gerlfriends,[_,green,_]),
    in_list(Gerlfriends,[_,blue,_]),
    in_list(Gerlfriends,[_,_,white]),
    in_list(Gerlfriends,[_,_,green]),
    in_list(Gerlfriends,[_,_,blue]),
    in_list(Gerlfriends,[anya,_,_]),
    in_list(Gerlfriends,[valya,_,_]),
    in_list(Gerlfriends,[natasha,_,green]),

    not(in_list(Gerlfriends,[valya,white,white])),
    not(in_list(Gerlfriends,[natasha,green,_])),

    write(Gerlfriends),!.

%Exercise 4
plant:-Artisans=[_,_,_],
        in_list(Artisans,[slesar,_,0,0,_]),
	in_list(Artisans,[tokar,_,_,1,_]),
	in_list(Artisans,[svarschik,_,_,_,_]),
	in_list(Artisans,[_,borisov,1,_,_]),
	in_list(Artisans,[_,ivanov,_,_,_]),
	in_list(Artisans,[_,semenov,_,2,borisov]),

write(Artisans),!.

%Exercise 5
vessel:-Liquids=[_,_,_,_],
    in_list(Liquids,[butylka,_]),
    in_list(Liquids,[stakan,_]),
    in_list(Liquids,[kuvshin,_]),
    in_list(Liquids,[banka,_]),
    in_list(Liquids,[_,woter]),
    in_list(Liquids,[_,milk]),
    in_list(Liquids,[_,lemonade]),
    in_list(Liquids,[_,kvass]),

    not(in_list(Liquids,[butylka,woter])),
    not(in_list(Liquids,[butylka,milk])),

    right_next([stakan,_],[_,lemonade],Liquids),
    right_next([_,lemonade],[_,kvass],Liquids),

    not(in_list(Liquids,[banka,imonade])),
    not(in_list(Liquids,[banka,woter])),

    next_to([banka,_],[kuvshin,_],Liquids),
    next_to([banka,_],[_,milk],Liquids),

write(Liquids),!.

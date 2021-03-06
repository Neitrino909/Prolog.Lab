genre(the_lord_of_the_rings:the_fellowship_of_the_ring,0).
genre(the_wither:the_last_wish,0).
genre(alice_in_wonderland,1).
genre(twenty_thousand_leagues_under_the_sea,2).
genre(kingdom_of_crooked_mirrors,1).
genre(time_machine,1).
genre(harry_potter_and_the_philosophers_stone,0).
genre(the_chronicles_of_narnia,0).
genre(the_hunger_games,1).
genre(the_hobbit_or_there_and_back_again,0).
genre(percy_jackson,0).
genre(walking_castle,0).
genre(war_and_peace,2).
genre(sherlock_holmes:a_study_in_scarlet,3).
genre(murder_on_morgue_street,3).
genre(ten_little_indians,3).
genre(the_deerslayer,2).
genre(the_headless_horseman,2).
genre(three_musketeers,2).
genre(treasure_island,2).
genre(the_girl_with_the_dragon_tattoo,3).
genre(thirty_three_misfortunes,3).

continuation(the_lord_of_the_rings:the_fellowship_of_the_ring,1).
continuation(the_wither:the_last_wish,1).
continuation(alice_in_wonderland,1).
continuation(twenty_thousand_leagues_under_the_sea,1).
continuation(kingdom_of_crooked_mirrors,0).
continuation(time_machine,0).
continuation(harry_potter_and_the_philosophers_stone,1).
continuation(the_chronicles_of_narnia,1).
continuation(the_hunger_games,1).
continuation(the_hobbit_or_there_and_back_again,0).
continuation(percy_jackson,1).
continuation(walking_castle,0).
continuation(war_and_peace,1).
continuation(sherlock_holmes:a_study_in_scarlet,1).
continuation(murder_on_morgue_street,0).
continuation(ten_little_indians,0).
continuation(the_deerslayer,1).
continuation(the_headless_horseman,0).
continuation(three_musketeers,1).
continuation(treasure_island,0).
continuation(the_girl_with_the_dragon_tattoo,1).
continuation(thirty_three_misfortunes,1).

age(the_lord_of_the_rings:the_fellowship_of_the_ring,0).
age(the_wither:the_last_wish,0).
age(alice_in_wonderland,1).
age(twenty_thousand_leagues_under_the_sea,0).
age(kingdom_of_crooked_mirrors,1).
age(time_machine,0).
age(harry_potter_and_the_philosophers_stone,1).
age(the_chronicles_of_narnia,1).
age(the_hunger_games,0).
age(the_hobbit_or_there_and_back_again,1).
age(percy_jackson,1).
age(walking_castle,1).
age(war_and_peace,0).
age(sherlock_holmes:a_study_in_scarlet,1).
age(murder_on_morgue_street,0).
age(ten_little_indians,0).
age(the_deerslayer,0).
age(the_headless_horseman,0).
age(three_musketeers,1).
age(treasure_island,1).
age(the_girl_with_the_dragon_tattoo,0).
age(thirty_three_misfortunes,1).

autor(the_lord_of_the_rings:the_fellowship_of_the_ring,1).
autor(the_wither:the_last_wish,1).
autor(alice_in_wonderland,1).
autor(twenty_thousand_leagues_under_the_sea,1).
autor(kingdom_of_crooked_mirrors,1).
autor(time_machine,1).
autor(harry_potter_and_the_philosophers_stone,0).
autor(the_chronicles_of_narnia,1).
autor(the_hunger_games,0).
autor(the_hobbit_or_there_and_back_again,1).
autor(percy_jackson,1).
autor(walking_castle,0).
autor(war_and_peace,1).
autor(sherlock_holmes:a_study_in_scarlet,1).
autor(murder_on_morgue_street,1).
autor(ten_little_indians,0).
autor(the_deerslayer,1).
autor(the_headless_horseman,1).
autor(three_musketeers,1).
autor(treasure_island,1).
autor(the_girl_with_the_dragon_tattoo,1).
autor(thirty_three_misfortunes,1).

hero(the_lord_of_the_rings:the_fellowship_of_the_ring,0).
hero(the_wither:the_last_wish,1).
hero(alice_in_wonderland,1).
hero(twenty_thousand_leagues_under_the_sea,1).
hero(kingdom_of_crooked_mirrors,1).
hero(time_machine,1).
hero(harry_potter_and_the_philosophers_stone,1).
hero(the_chronicles_of_narnia,0).
hero(the_hunger_games,1).
hero(the_hobbit_or_there_and_back_again,0).
hero(percy_jackson,1).
hero(walking_castle,0).
hero(war_and_peace,0).
hero(sherlock_holmes:a_study_in_scarlet,0).
hero(murder_on_morgue_street,1).
hero(ten_little_indians,1).
hero(the_deerslayer,0).
hero(the_headless_horseman,1).
hero(three_musketeers,0).
hero(treasure_island,1).
hero(the_girl_with_the_dragon_tattoo,1).
hero(thirty_three_misfortunes,0).

nationality(the_lord_of_the_rings:the_fellowship_of_the_ring,0).
nationality(the_wither:the_last_wish,0).
nationality(alice_in_wonderland,0).
nationality(twenty_thousand_leagues_under_the_sea,0).
nationality(kingdom_of_crooked_mirrors,1).
nationality(time_machine,0).
nationality(harry_potter_and_the_philosophers_stone,0).
nationality(the_chronicles_of_narnia,0).
nationality(the_hunger_games,0).
nationality(the_hobbit_or_there_and_back_again,0).
nationality(percy_jackson,0).
nationality(walking_castle,0).
nationality(war_and_peace,1).
nationality(sherlock_holmes:a_study_in_scarlet,0).
nationality(murder_on_morgue_street,0).
nationality(ten_little_indians,0).
nationality(the_deerslayer,0).
nationality(the_headless_horseman,0).
nationality(three_musketeers,0).
nationality(treasure_island,0).
nationality(the_girl_with_the_dragon_tattoo,0).
nationality(thirty_three_misfortunes,0).




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


pr:-question1(X1),
    question2(X2),
    question3(X3),
    question4(X4),
    question5(X5),
    question6(X6),

    genre(X,X1),
    continuation(X,X2),
    age(X,X3),
    autor(X,X4),
    hero(X,X5),
    nationality(X,X6),
    write(X),nl,fail.

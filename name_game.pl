% Lab 9 - Name Game

% Initial set of letters: a, b, c

:- dynamic letter/1.

% Start the game
start :-
    retractall(letter(_)),
    asserta(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    menu.

% Display the menu
menu :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    write('Choose from the following:'), nl,
    write('1 - Display the current set of letters'), nl,
    write('2 - Add a letter'), nl,
    write('3 - Add a letter at the top'), nl,
    write('4 - Add a letter at the bottom'), nl,
    write('5 - Delete a letter'), nl,
    write('6 - Delete all letters'), nl,
    write('7 - Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    handle_choice(Choice).

% Option 1: Display letters
handle_choice(1) :-
    nl,
    write('Current set of letters:'), nl,
    listing(letter/1),
    menu.

% Option 2: Add a letter
handle_choice(2) :-
    write('Enter a letter: '),
    read(Letter),
    assert(letter(Letter)),
    write('Letter added successfully.'), nl,
    menu.

% Option 3: Add a letter at the top
handle_choice(3) :-
    write('Enter a letter: '),
    read(Letter),
    asserta(letter(Letter)),
    write('Letter added at the top.'), nl,
    menu.

% Option 4: Add a letter at the bottom
handle_choice(4) :-
    write('Enter a letter: '),
    read(Letter),
    assertz(letter(Letter)),
    write('Letter added at the bottom.'), nl,
    menu.

% Option 5: Delete a letter
handle_choice(5) :-
    write('Enter the letter to delete: '),
    read(Letter),
    delete_letter(Letter),
    menu.

% Option 6: Delete all letters
handle_choice(6) :-
    retractall(letter(_)),
    write('All letters have been deleted.'), nl,
    menu.

% Option 7: Exit
handle_choice(7) :-
    write('Thank you for playing the Name Game!'), nl.

% Invalid choice
handle_choice(_) :-
    write('Invalid choice. Please try again.'), nl,
    menu.

% Delete a letter
delete_letter(Letter) :-
    retract(letter(Letter)),
    !,
    write('Letter deleted successfully.'), nl.

delete_letter(_) :-
    write('Letter not found.'), nl.

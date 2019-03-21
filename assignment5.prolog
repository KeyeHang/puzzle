:- use_module(library(lambda)).

puzzle :-
	puzzle(Moves),
	showpuzzle(Moves).
 
puzzle(Moves) :-
	play([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves).
 
play(_, [_], Lst, Moves) :-
	reverse(Lst, Moves).
 
play(Free, From, Lst, Moves) :-
	select(S, From, Fr1),
	select(O, Fr1, Fr2),
	select(E, Free, F1),
	move(S, O, E),
	play([S, O | F1], [E | Fr2], [move(S,O,E) | Lst], Moves).
 
%%%%%%describe moves%%%%%%

move(F,2,T) :-
	member([F,T], [[1,4], [4,1]]).
move(F,3,T) :-
	member([F,T], [[1,6], [6,1]]).
move(F,4,T):-
	member([F,T], [[2,7], [7,2]]).
move(F,5,T):-
	member([F,T], [[2,9], [9,2]]).
move(F,5,T):-
	member([F,T], [[3,8], [8,3]]).
move(F,6,T):-
	member([F,T], [[3,10], [10,3]]).
move(F,5,T):-
	member([F,T], [[4,6], [6,4]]).
move(F,7,T):-
	member([F,T], [[4,11], [11,4]]).
move(F,8,T):-
	member([F,T], [[4,13], [13,4]]).
move(F,8,T):-
	member([F,T], [[5,12], [12,5]]).
move(F,9,T):-
	member([F,T], [[5,14], [14,5]]).
move(F,9,T):-
	member([F,T], [[6,13], [13,6]]).
move(F,10,T):-
	member([F,T], [[6,15], [15,6]]).
move(F,8,T):-
	member([F,T], [[9,7], [7,9]]).
move(F,9,T):-
	member([F,T], [[10,8], [8,10]]).
move(F,12,T):-
	member([F,T], [[11,13], [13,11]]).
move(F,13,T):-
	member([F,T], [[12,14], [14,12]]).
move(F,14,T):-
	member([F,T], [[15,13], [13,15]]).
 
showpuzzle(Sol) :-
	showpuzzle(Sol, [1]).
 
showpuzzle([], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = .; I = *),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('~w            ~n', [I1]),
	format('~w ~w         ~n', [I2,I3]),
	format('~w ~w ~w      ~n', [I4,I5,I6]),
	format('~w ~w ~w ~w   ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	writeln(solvepuzzle).
 

showpuzzle([move(From, Over, To) | End], Free) :-
	numlist(1,15, Lst),
	maplist(\X^I^(member(X, Free) -> I = .; I = *),
		Lst,
		[I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15]),
	format('~w            ~n', [I1]),
	format('~w ~w         ~n', [I2,I3]),
	format('~w ~w ~w      ~n', [I4,I5,I6]),
	format('~w ~w ~w ~w   ~n', [I7,I8,I9,I10]),
	format('~w ~w ~w ~w ~w~n', [I11,I12,I13,I14,I15]),
	select(To, Free, F1),
	showpuzzle(End,  [From, Over | F1]).
move([X, 0, Z, A, B, C, D, E, F], [0, X, Z, A, B, C, D, E, F]). 
move([X, Z, 0, A, B, C, D, E, F], [X, 0, Z, A, B, C, D, E, F]).
move([A, B, C, X, 0, Z, D, E, F], [A, B, C, 0, X, Z, D, E, F]).
move([A, B, C, X, Z, 0, D, E, F], [A, B, C, X, 0, Z, D, E, F]).
move([A, B, C, D, E, F, X, 0, Z], [A, B, C, D, E, F, 0, X, Z]).
move([A, B, C, D, E, F, X, Z, 0], [A, B, C, D, E, F, X, 0, Z]).


move([0, X, Z, A, B, C, D, E, F], [X, 0, Z, A, B, C, D, E, F]).
move([X, 0, Z, A, B, C, D, E, F], [X, Z, 0, A, B, C, D, E, F]).
move([A, B, C, 0, X, Z, D, E, F], [A, B, C, X, 0, Z, D, E, F]).
move([A, B, C, X, 0, Z, D, E, F], [A, B, C, X, Z, 0, D, E, F]).
move([A, B, C, D, E, F, 0, X, Z], [A, B, C, D, E, F, X, 0, Z]).
move([A, B, C, D, E, F, X, 0, Z], [A, B, C, D, E, F, X, Z, 0]).

move([A, B, C, D, E, F, 0, X, Z], [A, B, C, 0, E, F, D, X, Z]).
move([A, B, C, D, E, F, X, 0, Z], [A, B, C, D, 0, F, X, E, Z]).
move([A, B, C, D, E, F, X, Z, 0], [A, B, C, D, E, 0, X, Z, F]).

move([0, B, C, A, E, F, D, H, I], [A, B, C, 0, E, F, D, H, I]).
move([A, 0, C, D, E, F, G, H, I], [A, E, C, D, 0, F, G, H, I]).
move([A, B, 0, D, E, F, G, H, I], [A, B, F, D, E, 0, G, H, I]).

solve(State, Goal) :-
    dfs([State], Goal, Path),
    write('Solution Path:'), nl,
    print_path(Path).


dfs([Goal|Visited], Goal, [Goal|Visited]).
dfs([Current|Visited], Goal, Path) :-
    move(Current, Next),
    \+ member(Next, Visited),
    dfs([Next, Current | Visited], Goal, Path).


print_path([]).
print_path([H | T]) :-
    print_state(H),
    nl,
    print_path(T).


print_state([A, B, C, D, E, F, G, H, I]) :-
    format('~w ~w ~w~n~w ~w ~w~n~w ~w ~w~n', [A, B, C, D, E, F, G, H, I]).
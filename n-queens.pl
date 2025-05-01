n_queens(N, Solution) :-
    range(1, N, Ns),
    permutation(Ns, Solution),
    safe(Solution).


range(Low, High, [Low|Rest]) :-
    Low < High,
    Next is Low + 1,
    range(Next, High, Rest).
range(High, High, [High]).


safe([]).
safe([Q|Others]) :-
    safe(Others),
    no_attack(Q, Others, 1).


no_attack(_, [], _).
no_attack(Q, [Q1|Others], D) :-
    Q =\= Q1,
    abs(Q - Q1) =\= D,
    D1 is D + 1,
    no_attack(Q, Others, D1).


permutation([], []).
permutation(List, [H|Perm]) :-
    select(H, List, Rest),
    permutation(Rest, Perm).
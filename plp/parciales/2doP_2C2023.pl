%prefijo(?P, +L)
prefijo(L,P) :- append(P,_,L).

%sufijo(?S, +L)
sufijo(L,P) :- append(_,P,L).

%sublista(?S, +L)
sublista(S, L) :- 
    sufijo(L, Suf), 
    prefijo(Suf, S).

%subseq(?Xs, ?L)
subseq([],[]).
subseq([X|Xs], [X|Ys]) :- subseq(Xs,Ys).
subseq([_|Xs], Ys) :- subseq(Xs,Ys).

%creciente(+L)
creciente([]).
creciente([_]).
creciente([X,Y|L]) :- X < Y, creciente([Y|L]).

%subsecuenciaCreciente(+L, -S)
subsecuenciaCreciente(L,S) :- subseq(L, S), creciente(S).

%subsecuenciaCrecienteMasLarga(+L, -S)
subsecuenciaCrecienteMasLarga(L,S) :- subsecuenciaCreciente(L,S), length(S, I), not((subsecuenciaCreciente(L,T), length(T,J), J > I)).

% Generador infinito de números desde(X, Y)
desde(X, X).
desde(X, Y) :-
    N is X + 1,
    desde(N, Y).

% fibonacci(-X): genera o verifica números de la secuencia de Fibonacci
fibonacci(X) :-
    desde(1, N),  % Genera índices de Fibonacci
    fib(N, X).    % Calcula el número de Fibonacci para el índice N

% fib(+N, -X): calcula el N-ésimo número de Fibonacci
fib(1, 1). 
fib(2, 1).
fib(N, X) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, X1),
    fib(N2, X2),
    X is X1 + X2.

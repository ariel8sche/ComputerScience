% Ejercicio 1

padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).
abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

% I. 
    % juan

% II.
hijo(X,Y) :- padre(Y,X).
hermano(X,Y) :- padre(Z,X), padre(Z,Y), X \= Y.
descendiente(X,Y) :- abuelo(Y,X).

% III.
    % [trace] 30 ?- descendiente(Alguien,juan).
            % Call: (12) descendiente(_2194, juan) ? creep
            % Call: (13) abuelo(juan, _2194) ? creep
            % Call: (14) padre(juan, _4306) ? creep
            % Exit: (14) padre(juan, carlos) ? creep
            % Call: (14) padre(carlos, _2194) ? creep
            % Exit: (14) padre(carlos, daniel) ? creep
            % Exit: (13) abuelo(juan, daniel) ? creep
            % Exit: (12) descendiente(daniel, juan) ? creep
        % Alguien = daniel ;
            % Redo: (14) padre(carlos, _2194) ? creep
            % Exit: (14) padre(carlos, diego) ? creep
            % Exit: (13) abuelo(juan, diego) ? creep
            % Exit: (12) descendiente(diego, juan) ? creep
        % Alguien = diego ;
            % Redo: (14) padre(juan, _4306) ? creep
            % Exit: (14) padre(juan, luis) ? creep
            % Call: (14) padre(luis, _2194) ? creep
            % Exit: (14) padre(luis, pablo) ? creep
            % Exit: (13) abuelo(juan, pablo) ? creep
            % Exit: (12) descendiente(pablo, juan) ? creep
        % Alguien = pablo ;
            % Redo: (14) padre(luis, _2194) ? creep
            % Exit: (14) padre(luis, manuel) ? creep
            % Exit: (13) abuelo(juan, manuel) ? creep
            % Exit: (12) descendiente(manuel, juan) ? creep
        % Alguien = manuel ;
            % Redo: (14) padre(luis, _2194) ? creep
            % Exit: (14) padre(luis, ramiro) ? creep
            % Exit: (13) abuelo(juan, ramiro) ? creep
            % Exit: (12) descendiente(ramiro, juan) ? creep
        % Alguien = ramiro.

% IV.
    % abuelo(juan,Nieto)
    % descendiente(Nieto,juan)

% V.
    % hermano(pablo, Brother)

% VI.

ancestro(X, X).
ancestro(X, Y) :- ancestro(Z, Y), padre(X, Z).

% VII.
    % Se cuelga

% Ejercicio 3

natural(0).
natural(suc(X)) :- natural(X).
menorOIgual(X,X) :- natural(X).
menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

% I.
    % Se cuelga en la segunda regla menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

% II.
    % Que siempre caiga en una misma regla o esa regla se llama a si misma

% III.
    % Cambio el orden de la segunda regla (menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).) por la tercer regla (menorOIgual(X,X) :- natural(X).)

% Ejercicio 4

juntar([], L, L).
juntar([L1|L1S], L2, [L1|L3S]) :- juntar(L1S,L2,L3S).

% Ejercicio 5

% I:

last(L, U) :- append(_,[U],L).

% II:

reverse2([], []).
reverse2([H|T], R) :- reverse2(T, RT), append(RT, [H], R).

% III.

prefijo(L,P) :- append(P,_,L).

% IV.

sufijo(L,P) :- append(_,P,L).

% V.

sublista([],[]).
sublista(SL,[_|L]) :- sublista(SL,L).
sublista([X|SL],[X|L]) :- sublista(SL,L).

% VI.

pertenece([],_) :- fail.
pertenece(LS,E) :- append([E], _, LS).
pertenece([_|LS],E) :- pertenece(LS,E).

% Ejercicio 6

aplanar([],[]).
aplanar([X|Xs],L) :- is_list(X), aplanar(X,Lx), aplanar(Xs,Ls), append(Lx,Ls,L).
aplanar([X|Xs],[X|L]) :- not(is_list(X)), aplanar(Xs,L).

% Ejercicio 7

palindromo(L,L1) :- reverse(L,Lr), append(L,Lr,L1).

iesimo(0, [E|_], E). 
iesimo(I, [_|Xs], E) :- I > 0, I2 is I-1, iesimo(I2, Xs, E). 

% Ejercicio 8

%intersección(+L1, +L2, -L3)
interseccion([],_,[]).
interseccion(_,[],[]).
interseccion([X|Xs],L2,[X|L3]) :- member(X,L2), interseccion(Xs, L2, L3).
interseccion([X|Xs],L2,L3) :- not(member(X,L2)), interseccion(Xs, L2, L3).

%partir(?N, ?L, ?L1, ?L2)
partir(N, L, L1, L2) :- nonvar(L1), nonvar(L2), length(L,P), append(L1,L2,L), length(L1,N), P >= N.
partir(N, L, L1, L2) :- nonvar(L), append(L1,L2,L), length(L,P), length(L1,N), P >= N.
partir(N, L, L1, L2) :- append(L1,L2,L), length(L,P), length(L1,N), P >= N.

%borrar(+ListaOriginal, +X, -ListaSinXs)
borrar([], _, []). 
borrar([X|L], X, Ys) :- borrar(L, X, Ys). 
borrar([Y|L], X, [Y|Ys]) :- Y \= X, borrar(L, X, Ys). 

%sacarDuplicados(+L1, -L2)
sacarDuplicados([], []).
sacarDuplicados([X|Xs], L1) :- member(X,Xs), sacarDuplicados(Xs,L1).
sacarDuplicados([X|Xs], [X|L1]) :- not(member(X,Xs)), sacarDuplicados(Xs,L1).

%permutacion(+L1, ?L2). usando insertar
insertar(X, [], [X]).
insertar(X, [Y|Ys], [X, Y|Ys]).
insertar(X, [Y|Ys], [Y|Zs]) :- insertar(X, Ys, Zs).

permutacion([], []).
permutacion([X|Xs], Ys) :- permutacion(Xs, Ys2), insertar(X, Ys2, Ys).

reparto([],1,[[]]).
reparto(L,1,[L]).
reparto([],N,[[]|LLista]) :- N > 1, N2 is N-1, reparto([],N2, LLista).
reparto([X|L],N,[[X]|LLista]) :- N > 1, N2 is N-1, reparto(L,N2,LLista).
reparto([], N, [[]|LLista]) :- N > 1, N2 is N - 1, reparto([], N2, LLista).
reparto([X|L], N, [[X|SubLista]|LLista]) :- N > 1, reparto(L, N, [SubLista|LLista]).
reparto(L, N, [[]|LLista]) :- N > 1, N2 is N - 1, reparto(L, N2, LLista).

%Ejercicio 9

%parteQueSuma(+L,+S,-P)
parteQueSuma(L, S, P) :- sublista(P, L), sum_list(P, S).

% Ejercicio 10

% I. X debe ser menor o igual a Y para que funcione

desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

% II.

desde2(X,X).
desde2(X,Y) :- X > Y, M is Y+1, desde2(X,M).
desde2(X,Y) :- N is X+1, desde2(N,Y).

% Ejercicio 11

intercalarParalelo([],YS,YS).
intercalarParalelo(XS,[],XS) :- XS \= [].
intercalarParalelo([X|XS],[Y|YS],[X|[Y|ZS]]) :- intercalarParalelo(XS,YS,ZS).

% Ejercicio 12

vacio(nil).

raiz(bin(_,V,_), V).

altura(nil, 0).
altura(bin(I,_,D), A) :- altura(I, Ai), altura(D, Ad), Ai >= Ad, A is Ai + 1.
altura(bin(I,_,D), A) :- altura(I, Ai), altura(D, Ad), Ad > Ai, A is Ad + 1.

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I,_,D), N) :- cantidadDeNodos(I, Ni), cantidadDeNodos(D, Nd), N is Ni + Nd + 1.

% Ejercicio 12

% I)

%inorder(+AB,-Lista)
inorder(nil, []).
inorder(bin(I,V,D), L) :-  inorder(I,Li), inorder(D,Ld), append(Li, [V|Ld], L).

% II)

%arbolConInorder(+Lista,-AB).
arbolConInorder([], nil).
arbolConInorder(L, bin(I,V,D)) :- append(Ri, [V|Rd], L), arbolConInorder(Ri, I), arbolConInorder(Rd, D).

% III)

%aBB(+T)
aBB(nil).
aBB(bin(nil, _, nil)).
aBB(bin(I, V, nil)) :- not(vacio(I)), raiz(I, Vi), V >= Vi, aBB(I).
aBB(bin(nil, V, D)) :- not(vacio(D)), raiz(D, Vd), Vd > V, aBB(D).
aBB(bin(I,V,D)) :- not(vacio(I)), not(vacio(D)), raiz(I, Vi), raiz(D, Vd), V >= Vi, Vd > V, aBB(I), aBB(D).

% IV)

%aBBInsertar(+X, +T1, -T2)
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(I,V,D), bin(I,V,T)) :- aBB(bin(I,V,D)), X > V, aBBInsertar(X, D, T), aBB(T).
aBBInsertar(X, bin(I,V,D), bin(T,V,D)) :- aBB(bin(I,V,D)), X =< V, aBBInsertar(X, I, T), aBB(T).

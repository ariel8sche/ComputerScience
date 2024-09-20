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
hermano(X,Y) :-padre(Z,X), padre(Z,Y).
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

% VIII.
    % 

% Ejercicio 2

vecino(X, Y, [X|[Y|_]]).
vecino(X, Y, [W|Ls]) :- W \= X, vecino(X, Y, Ls).

% I.
    % vecino(5, Y, [5,6,5,3])
    %       vecino(5, 6, [5|[6|[5,3]]])  {Y = 6}
    %               Ok
    %       vecino(5, Y, [6,5,3]) {Ls = [6,5,3], W = 5}
    %               vecino(X, Y, [5,3]) {Ls2 = [5,3], W2 = 6}
    %                       vecino(5, 3, [5|[3|[]]]) {Y = 3}
    %                               Ok

% II.
    % El resultado es el mismo, lo unico que cambia es el orden de mostrar los vecinos
    % Mira la regla vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls) primero, ahi saca que Y=3 y como no tiene mas posibles soluciones pasa al siguiente predicado
    % vecino(X, Y, [X|[Y|Ls]]) de aca saca Y=6

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

append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

% I:

last(L, U) :- append(_,[U],L).

%last([U|[]],U).
%last([L|LS], U) :- last(LS,U).

% II:

reverse([], []).
reverse([H|T], R) :- reverse(T, RT), append(RT, [H], R).

% III.

prefijo(L,P) :- append(P,_,L).

% IV.

sufijo(L,P) :- append(_,P,L).

% V.

sublista([], _).
sublista(S, L) :-
    append(Prefijo, Resto, L),
    append(S, Sufijo, Resto),
    S \= [],
    Prefijo \= [],
    Sufijo \= [].

% VI.

pertenece([],_) :- fail.
pertenece(LS,E) :- append([E], _, LS).
pertenece([_|LS],E) :- pertenece(LS,E).

% member es la funcion definida en Prolog 

% Ejercicio 6

esLista([]).
esLista([_|_]).

aplanar([],[]).
aplanar([X|Xs], Ys) :- esLista(X), aplanar(X, X2), aplanar(Xs,Y2), append(X2,Y2,Ys).
aplanar([X|Xs], [X|Ys]) :- \+ is_list(X), aplanar(Xs,Ys).

% flatten es la funcion definida en Prolog

% Ejercicio 7

% I.

palindromo(L, L1) :- reverse(L,X), append(L,X,L1).

% II.

iesimo(_,[],_) :- fail.
iesimo(1, [X|_], X).
iesimo(I, [_|Ls], X) :- I2 is I-1, iesimo(I2, Ls, X).

% Ejercicio 8

% I.

long([],0).
long([_|XS],N) :- long(XS,N2), N is N2+1.

interseccion([], _, []).
interseccion([X|Xs], Ys, [X|Zs]) :- member(X, Ys), borrar(Xs, X, L), interseccion(L, Ys, Zs).
interseccion([X|Xs], Ys, Zs) :- not(member(X, Ys)), interseccion(Xs, Ys, Zs).

partir(1, L, [X], _) :- L = [X|_].
partir(N, [X|L], [X|L1], L2) :- N2 is N - 1, partir(N2, L, L1, L2), append([X|L1], L2, [X|L]).

% Tiene que estar instancidos N y L. L1 y L2 pueden no estar instancidos

% II.

borrar([], _, []).
borrar([X|Rest], X, Result) :- borrar(Rest, X, Result).
borrar([First|Rest], X, [First|Result]) :- X \= First, borrar(Rest, X, Result).

% III.

sacarDuplicados([],[]).
sacarDuplicados([X|L1], L2) :- \+ member(X, L2), sacarDuplicados(L1,[X|L2]).
sacarDuplicados([X|L1], L2) :- member(X, L2), sacarDuplicados(L1,L2).
% Preguntar

% IV.

insertar(X, [], [X]).
insertar(X, [Y|Ys], [X,Y|Ys]).
insertar(X, [Y,Ys], [Y|Zs]) :- insertar(X, Ys, Zs).

permutacion([],[]).
permutacion([X|Xs],Ys) :- permutacion(Xs,Ys2), insertar(X,Ys2,Ys).

% V.

reparto([],1,[[]]).
reparto(L,1,[L]).
reparto([],N,[[]|LLista]) :- N2 is N-1, reparto([],N2, LLista).
reparto([X|L],N,[[X]|LLista]) :- N2 is N-1, reparto(L,N2,LLista).

% VI.

repartoSV([X],[[X]]).
repartoSV([X|L],Y) :- repartoSV(L, LLista), append([[X]],LLista,Y).

% 10

% I. X debe ser menor o igual a Y para que funcione

desde(X,X).
desde(X,Y) :- N is X+1, desde(N,Y).

% II.

desde2(X,X).
desde2(X,Y) :- X > Y, M is Y+1, desde2(X,M).
desde2(X,Y) :- N is X+1, desde2(N,Y).

% Ejercicio 12

vacio(nil).

raiz(bin(_, V, _), V).

max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

altura(nil, 0).
altura(bin(I,_,D), N2) :- altura(I, X), altura(D,Y), max(X, Y, N), N2 is N + 1.

%bin(bin(bin(nil,1,nil),3,bin(nil,5,nil)),6,bin(nil,9,nil))

cantidadDN(nil, 0).
cantidadDN(bin(I,_,D),N) :- cantidadDN(I, X), cantidadDN(D, Y), N is X+Y+1.

% Ejercicio 13

%I.
inorder(nil, []).
inorder(bin(I, V, D), L) :- inorder(I, ListaIzq), inorder(D, ListaDer), append(ListaIzq, [V|ListaDer], L).

%II.
arbolConInorder([], nil).
arbolConInorder(Ls, bin(I, V, D)) :- append(Ls1, [V], Ls), append(X, Y, Ls1), arbolConInorder(X, I), arbolConInorder(Y, D).

%III.
aBB(nil).
aBB(bin(nil, _, nil)).
aBB(bin(I, V, D)) :- raiz(I, Iv), raiz(D, Dv), V >= Iv, Dv > V, aBB(I), aBB(D). 

%bin(bin(bin(nil,1,nil),3,bin(nil,4,nil)),5,bin(bin(nil,6,nil),8,bin(nil,9,nil)))

aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(_,V,_), bin(_,V,_)) :- V == X.
aBBInsertar(X, bin(I,V,D), bin(T, V, D)) :- X =< V, aBBInsertar(X, I, T).
aBBInsertar(X, bin(I,V,D), bin(I, V, T)) :- X >= V, aBBInsertar(X, D, T).

% Ejercicio 14

coprimos(X,Y) :- desde(2,X), between(1, X, Y), gcd(X, Y) =:= 1.

% Ejercicio 15

%I.
longCuadrado([], 0).
longCuadrado([_|Filas], N) :- N > 0, N2 is N-1, longCuadrado(Filas, N2).

suman([], 0).
suman([L|Ls], X) :- between(0, X, L), X1 is X-L, suman(Ls, X1).

cuadradoSemiLatino(N, [Fila|Filas]) :- desde(1,X), longCuadrado([Fila|Filas], N), longCuadrado(Fila, N), suman(Fila, X), cuadradoSemiLatinoAux(X, N, [Fila|Filas]).

cuadradoSemiLatinoAux(_, _, []).
cuadradoSemiLatinoAux(X, N, [L|Ls]) :- longCuadrado(L, N), suman(L, X), cuadradoSemiLatinoAux(X, N, Ls).

%II.
cuadradoMagico(N, Xs) :- cuadradoSemiLatino(N, Xs), columnaSuma(Xs, X, 1), between(1, N, Y), columnaSumaIgual(Xs, X, Y).

columnaSuma([], 0, _).
columnaSuma([L|Ls], X, I) :- iesimo(I, L, Y), columnaSuma(Ls, K, I), X is Y + K. 

columnaSumaIgual(Xs, X, Y) :- columnaSuma(Xs, X2, Y), X is X2.

% Ejercicio 16

%I.
esTriangulo(tri(A,B,C)):- A > 0, B > 0, C > 0, 
                        A1 is B+C, A2 is abs(B-C),  A1 > A, A > A2,
                        B1 is A+C, B2 is abs(A-C),  B1 > B, B > B2,
                        C1 is B+A, C2 is abs(A-B),  C1 > C, C > C2.

%II.
perimetro(tri(A,B,C), P) :- ground(tri(A,B,C)), esTriangulo(tri(A,B,C)), P is A+B+C.
perimetro(tri(A,B,C), P) :- not(ground(tri(A,B,C))), suman([A,B,C],P), A>0, B>0, C>0.

%III.
triangulo(T) :- desde(1, N), perimetro(T,N).
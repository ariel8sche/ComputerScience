% palabra(+A, +N, -C)



palabra(_, 0, []).
palabra(Alfabeto, N, [Letra|Palabra])	:- N>0, member(Letra, Alfabeto), N1 is N-1, palabra(Alfabeto, N1, Palabra). 


frase(Alfabeto, F) :- desde(0, LongFrase), fraseDeN(Alfabeto, LongFrase, F).



fraseDeN(_, 0, []).
fraseDeN(Alfabeto, N, [Palabra|Frase])	:-	N > 0, between(1, N, S), palabra(Alfabeto, S, Palabra), N1 is N-S, fraseDeN(Alfabeto, N1, Frase).


desde(X,X).
desde(X,Y) 	:- X1 is X+1, desde(X1, Y).

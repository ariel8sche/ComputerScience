def main():
    n=int(input())
    s=list(input())
    t=list(input())
    
    ab = []
    ba = []
    swaps = []
    
    # Si la cantidad de letras "a" o "b" es impar directamente retorno -1, porque no se puede lograr
    if (s.count("a") + t.count("a")) % 2 == 1 or (s.count("b") + t.count("b")) % 2 == 1:
        return print(-1)
    
    # Separo los indices que son de la forma "ab" (siendo "a" una letra de la primer lista y "b" un elemento de la segunda lista) y "ba" (siendo "b" una letra de la primer lista y "a" un elemento de la segunda lista) 
    for i in range(n):
        if s[i] == 'a' and t[i] == 'b':
            ab.append(i)
        if s[i] == 'b' and t[i] == 'a':
            ba.append(i)
    
    # Hago el swap de dos "ab" para que me quede "aa" y "bb"
    while len(ab) > 1:  
        i= ab.pop()
        j= ab.pop()
        swaps.append((i+1,j+1))
    
    # Hago el swap de dos "ba" para que me quede "bb" y "aa" 
    while len(ba) > 1:  
        i= ba.pop()
        j= ba.pop()
        swaps.append((i+1,j+1))
    
    # Si me quedan un elemento en cada lista hago el swap final
    if ab and ba:
        i = ab.pop()
        j = ba.pop()
        swaps.append((i + 1, i + 1))
        swaps.append((i + 1, j + 1))
    
    # Imprimo los resultados
    print(len(swaps))
    for i in range(len(swaps)):
        print(f"{swaps[i][0]} {swaps[i][1]}")
              
main()
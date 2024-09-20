import time

def bOrW(s, i, b, w, mem):
    if i == len(s):
        return 0
    
    if (i, b, w) in mem:
        return mem[(i, b, w)]
    
    unpainted = bOrW(s, i+1, b, w, mem) + 1
    
    if b == -1 or s[i] > s[b]:
        black = bOrW(s, i+1, i, w, mem)
    else:
        black = float('inf')
        
    if w == -1 or s[i] < s[w]:
        white = bOrW(s, i+1, b, i, mem)
    else:
        white = float('inf')
        
    res = min(unpainted, white, black)
    mem[(i, b, w)] = res
    return res

def main():
    n = int(input())
    while n != -1:
        sequence = input()
        sequence = list(map(int, sequence.split()))
        mem = {}
        
        inicio = time.time()
        resultado = bOrW(sequence, 0, -1, -1, mem)
        fin = time.time()
        
        print(f"Resultado: {resultado}")
        print(f"Tiempo de ejecución: {fin - inicio} segundos")
        
        n = int(input())

main()

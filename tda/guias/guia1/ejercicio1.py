#  Version sin regla de Factibilidad

def ss(c, k):
    n = len(c)
    if n < 0:
        return False
    if n == 0:
        return k == 0
    return ss(c[:n-1],k) | ss(c[:n-1],k-c[n-1])

# Version con regla de Factibilidad

def ss(c, k):
    n = len(c)
    if k < 0:
        return False
    if n < 0:
        return False
    if n == 0:
        return k == 0
    return ss(c[:n-1],k) | ss(c[:n-1],k-c[n-1])

#  Version que imprime el subconjunto

def ss(c, k, subset=[]):
    n = len(c)
    if k < 0:
        return False
    if n == 0:
        if k == 0:
            print(subset)
            return True
        return False
    
    # Incluyendo el último elemento en el subconjunto
    if ss(c[:n-1], k-c[n-1], subset + [c[n-1]]):
        return True
    
    # Excluyendo el último elemento del subconjunto
    if ss(c[:n-1], k, subset):
        return True
    
    return False

print(ss([6,12,6],24))
    
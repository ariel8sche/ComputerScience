def main():
    cases = int(input())
    for k in range(cases):
        cantEstablos = input()
        cantEstablos, vacas = tuple(map(int, cantEstablos.split()))
        establos = []
        for i in range(cantEstablos):
            s = int(input())
            establos.append(s)
            
        establos = sorted(establos)
        print(agressiveCows(establos,vacas, cantEstablos))
    
def colocarVaca(establos, vacas, dist, n):
    ultimaVaca = establos[0]
    vacasColocadas = 1
    for i in range(1,n):
        if (establos[i] - ultimaVaca) >= dist:
            vacasColocadas += 1
            ultimaVaca = establos[i]
            if vacasColocadas == vacas:
                return True
    return False

def agressiveCows(establos, vacas, cantEstablos):
    left = 1
    right = establos[-1] - establos[0]
    dist = 0
    
    while left <= right:
        mid = (right + left) // 2
        if colocarVaca(establos, vacas, mid, cantEstablos):
            dist = mid
            left = mid + 1
        else:
            right = mid - 1
            
    return dist

main()
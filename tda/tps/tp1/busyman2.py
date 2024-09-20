def busyman(actividades,i,k,mem):
    if i == len(actividades):
        return 0
    elif mem[i][k] != -1:
        return mem[i][k]
    elif k==-1 or actividades[k][1] <= actividades[i][0]: 
        mem[i][k] = max(busyman(actividades, i+1, i,mem)+1, busyman(actividades,i+1,k,mem))
    else:
        mem[i][k] = busyman(actividades,i+1,k,mem)
        
    return mem[i][k]

def main():
    cases = int(input())
    for i in range(cases):
        activities = int(input())
        t = []
        for k in range(activities):
            act = input()
            act = tuple(map(int, act.split()))
            t.append(act)
        actividades = sorted(t, key=lambda x: (x[1], x[0]))
        print(busyman(actividades,0,-1,[[-1 for _ in range (len(actividades))] for _ in range (len(actividades))]))
        
main()
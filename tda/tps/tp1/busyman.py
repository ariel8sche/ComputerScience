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
        max = 0
        last = None
        for i in range(activities):
            if i == 0 or actividades[i][0] >= last[1]:
                max += 1
                last = actividades[i]
        print(max)
    
main()
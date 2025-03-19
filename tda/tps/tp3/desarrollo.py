def main():
    corner = int(input())
    distances = [list(map(int, input().split())) for _ in range(corner)]
    order = list(map(int, input().split()))
    res = []
    active_corner = [False] * corner
    
    for node in reversed(order):
        active_corner[node - 1] = True

        for k in range(corner):
            if active_corner[k]:
                for i in range(corner):
                    if active_corner[i]:
                        for j in range(corner):
                            if active_corner[j]:
                                distances[i][j] = min(distances[i][j], distances[i][k] + distances[k][j])

        sum_dist = 0
        for i in range(corner):
            if active_corner[i]:
                for j in range(corner):
                    if active_corner[j] and i != j:
                        sum_dist += distances[i][j]

        res.append(sum_dist)

    res.reverse()
    
    for r in res:
        print(r)

main()
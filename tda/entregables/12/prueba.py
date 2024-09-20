costs = [[0, 35, 40], [6, 0, 5], [1, 2, 0]]
index=0
energy=0
num_fortress = 3

def update_cost(costs, tower):
        n = len(costs)
        for i in range(n):
            if i != tower:
                costs[tower][i] = 0
                costs[i][tower] = 0
        return costs
    
for i in range(num_fortress):
    for j in range(num_fortress):
        for k in range(num_fortress):
            energy = energy + costs[j][k]
    costs=update_cost(costs, i)
print(energy)
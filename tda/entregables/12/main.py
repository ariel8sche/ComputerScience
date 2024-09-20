def floyd_warshall(costs):

    n = len(costs)
    
    min_distances = costs.copy()
    
    for k in range(n):
        for i in range(n):
            for j in range(n):
                min_distances[i][j] = min(min_distances[i][j], min_distances[i][k] + min_distances[k][j])
    
    return min_distances

def update_cost(costs, tower):
        n = len(costs)
        for i in range(n):
            if i != tower:
                costs[tower][i] = 0
                costs[i][tower] = 0
        return costs

def main():
    file_path = "input.txt"
    with open(file_path, 'r') as file:
        t = int(file.readline().strip())
        
        test_cases = []

        for _ in range(t):
            n = int(file.readline().strip())
            
            energy_matrix = [[0]*n for _ in range(n)]
            
            for i in range(n):
                row = list(map(int, file.readline().split()))
                energy_matrix[i] = row
            
            destruction_order = list(map(int, file.readline().split()))
            
            test_cases.append((n, energy_matrix, destruction_order))
    
        for i in range(t):
            cost=test_cases[i][1]
            num_fortress =test_cases[i][0]
            order = test_cases[i][2]
            energy = 0
            floyd_warshall(cost)
            for i in range(num_fortress):
                for j in range(num_fortress):
                    for k in range(num_fortress):
                        energy = energy + cost[j][k]
                cost=update_cost(cost, i)
            print(energy)
                
main()
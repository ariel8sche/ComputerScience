from collections import deque

INF = float('inf')

def bfs(s, t, parent, capacity, adj):
    parent[:] = [-1] * len(parent)
    parent[s] = -2
    q = deque([(s, INF)])

    while q:
        cur, flow = q.popleft()

        for next_node in adj[cur]:
            if parent[next_node] == -1 and capacity[cur][next_node] > 0:
                parent[next_node] = cur
                new_flow = min(flow, capacity[cur][next_node])
                if next_node == t:
                    return new_flow
                q.append((next_node, new_flow))

    return 0

def maxflow(n, s, t, capacity, adj):
    flow = 0
    parent = [-1] * n

    while True:
        new_flow = bfs(s, t, parent, capacity, adj)
        if new_flow == 0:
            break
        flow += new_flow
        cur = t
        while cur != s:
            prev = parent[cur]
            capacity[prev][cur] -= new_flow
            capacity[cur][prev] += new_flow
            cur = prev

    return flow


def main():
    vertices, moves = tuple(map(int, input().split()))
    inputClassroom = list(map(int, input().split()))
    capacityClassroom = list(map(int, input().split()))
    
    total_vertices = 2 * vertices + 2
    capacities = [[0 for _ in range(total_vertices)] for _ in range(total_vertices)]
    adj = {i: [] for i in range(total_vertices)}
    
    s = 0
    t = total_vertices - 1
    
    for i in range(1, vertices + 1):
        in_vertex = i
        out_vertex = vertices + i
        adj[in_vertex].append(out_vertex)
        capacities[in_vertex][out_vertex] = INF

    for i in range(1, vertices + 1):
        adj[s].append(i)
        adj[i].append(s)
        capacities[s][i] = inputClassroom[i - 1]

    for i in range(1, vertices + 1):
        out_vertex = vertices + i
        adj[out_vertex].append(t)
        adj[t].append(out_vertex)
        capacities[out_vertex][t] = capacityClassroom[i - 1]

    for _ in range(moves):
        v, w = tuple(map(int, input().split()))
        in_v, out_v = v, vertices + v
        in_w, out_w = w, vertices + w

        adj[out_v].append(in_w)
        adj[in_w].append(out_v)
        capacities[out_v][in_w] = INF

        adj[out_w].append(in_v)
        adj[in_v].append(out_w)
        capacities[out_w][in_v] = INF
    
    maxf = maxflow(vertices+2,s,t,capacities,adj)
    
    if (sum(inputClassroom)==maxf): print("YES") 
    else: print("NO")
    
    
    
main()
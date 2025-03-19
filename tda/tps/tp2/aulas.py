from collections import deque

def bfs(start, tunnels):
    queue = deque([start]) 
    visited = {start: True}
    energy = [0]*len(tunnels)
    
    while queue:
        currentNode = queue.popleft()
        
        if currentNode+1 < len(tunnels) and currentNode+1 not in visited:   
            queue.append(currentNode+1)
            visited[currentNode+1] = True
            energy[currentNode+1] = energy[currentNode]+1
            
        if currentNode-1 >= 0 and currentNode-1 not in visited:   
            queue.append(currentNode-1)
            visited[currentNode-1] = True
            energy[currentNode-1] = energy[currentNode]+1
        
        if tunnels[currentNode]-1 != currentNode and tunnels[currentNode]-1 not in visited:
            queue.append(tunnels[currentNode]-1)
            energy[tunnels[currentNode]-1]= energy[currentNode]+1
            visited[tunnels[currentNode]-1] = True
                
    return energy

def main():
    n = int(input().strip())
    tunnels = list(map(int, input().strip().split()))
    
    res = bfs(0,tunnels)
        
    print(" ".join(map(str, res)))

main()
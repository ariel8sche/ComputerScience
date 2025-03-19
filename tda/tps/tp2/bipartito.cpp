#include <iostream>
#include <vector>
#include <queue>
#include <unordered_map>

using namespace std;

unordered_map<int, vector<int>> adjacencyList(const vector<pair<int, int>>& edgeList) {
    unordered_map<int, vector<int>> adjList;
    for (const auto& edge : edgeList) {
        int node1 = edge.first, node2 = edge.second;
        adjList[node1].push_back(node2);
        adjList[node2].push_back(node1);
    }
    return adjList;
}

pair<int, int> bfs(const unordered_map<int, vector<int>>& adjList, int start) {
    queue<int> q;
    unordered_map<int, bool> visited;
    unordered_map<int, int> level;
    
    q.push(start);
    visited[start] = true;
    level[start] = 0;
    
    int evenVertices = 0, oddVertices = 0;
    
    while (!q.empty()) {
        int currentNode = q.front();
        q.pop();
        
        if (level[currentNode] % 2 == 0) {
            evenVertices++;
        } else {
            oddVertices++;
        }
        
        for (int neighbor : adjList.at(currentNode)) {
            if (!visited[neighbor]) {
                q.push(neighbor);
                level[neighbor] = level[currentNode] + 1;
                visited[neighbor] = true;
            }
        }
    }
    
    return {evenVertices, oddVertices};
}

int main() {
    int vertices;
    cin >> vertices;
    
    vector<pair<int, int>> edges;
    for (int i = 0; i < vertices - 1; ++i) {
        int u, v;
        cin >> u >> v;
        edges.emplace_back(u, v);
    }
    
    auto adjList = adjacencyList(edges);
    
    if (edges.empty() || vertices <= 1) {
        cout << 0 << endl;
    } else {
        int start_node = edges[0].first;
        auto [evenCount, oddCount] = bfs(adjList, start_node);
        cout << (evenCount * oddCount - edges.size()) << endl;
    }
    
    return 0;
}

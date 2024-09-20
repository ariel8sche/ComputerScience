#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <algorithm>
using namespace std;

map<int, vector<int>> adjacencies(vector<pair<int, int>> &edgeList) {
    map<int, vector<int>> adjacencyList;
    for (auto &edge : edgeList) {
        int node1 = edge.first, node2 = edge.second;
        adjacencyList[node1].push_back(node2);
        adjacencyList[node2].push_back(node1);
    }
    return adjacencyList;
}

void DFS(map<int, vector<int>> &adjacencyList, int start, map<int, bool> &visited) {
    vector<int> stack = {start};
    visited[start] = true;
    while (!stack.empty()) {
        int actualNode = stack.back();
        stack.pop_back();
        for (auto neighbor = adjacencyList[actualNode].rbegin(); neighbor != adjacencyList[actualNode].rend(); ++neighbor) {
            if (!visited[*neighbor]) {
                stack.push_back(*neighbor);
                visited[*neighbor] = true;
            }
        }
    }
}

int countComponents(map<int, vector<int>> &adjacencyList, map<int, bool> &visited) {
    int count = 0;
    for (auto &vertex : adjacencyList) {
        if (!visited[vertex.first]) {
            DFS(adjacencyList, vertex.first, visited);
            count++;
        }
    }
    return count;
}

map<int, vector<int>> deleteVertex(map<int, vector<int>> adjacencyList, int vertex) {
    adjacencyList.erase(vertex);
    for (auto &node : adjacencyList) {
        node.second.erase(remove(node.second.begin(), node.second.end(), vertex), node.second.end());
    }
    return adjacencyList;
}

void dfs2(map<int, vector<int>> &adjacencyList, int start, map<int, int> &parents, map<int, bool> &visited,
          map<int, int> &orden, map<int, int> &low, set<int> &artPoints, int &time) {
    visited[start] = true;
    orden[start] = low[start] = time++;
    int children = 0;

    for (int neighbor : adjacencyList[start]) {
        if (!visited[neighbor]) {
            parents[neighbor] = start;
            children++;
            dfs2(adjacencyList, neighbor, parents, visited, orden, low, artPoints, time);
            low[start] = min(low[start], low[neighbor]);

            if (parents[start] == -1 && children > 1)
                artPoints.insert(start);

            if (parents[start] != -1 && low[neighbor] >= orden[start])
                artPoints.insert(start);
        } else if (neighbor != parents[start]) {
            low[start] = min(low[start], orden[neighbor]);
        }
    }
}

vector<pair<int, int>> cutVertices(map<int, vector<int>> &adjacencyList, int k) {
    int n = adjacencyList.size();
    map<int, bool> visited;
    map<int, int> parents, orden, low;
    set<int> artPoints;
    int time = 0;

    for (auto &vertex : adjacencyList) {
        if (!visited[vertex.first]) {
            dfs2(adjacencyList, vertex.first, parents, visited, orden, low, artPoints, time);
        }
    }

    vector<pair<int, int>> output;
    for (int vertex : artPoints) {
        auto graph = adjacencyList;
        visited.clear();
        auto modified_graph = deleteVertex(graph, vertex);
        int components = countComponents(modified_graph, visited);
        output.push_back({vertex, components});
    }

    for (auto &vertex : adjacencyList) {
        if (output.size() == k)
            break;
        else if (artPoints.find(vertex.first) == artPoints.end()) {
            output.push_back({vertex.first, 1});
        }
    }

    sort(output.begin(), output.end(), [](const pair<int, int> &a, const pair<int, int> &b) {
        return (a.second > b.second) || (a.second == b.second && a.first < b.first);
    });

    return output;
}

int main() {
    
    ios_base::sync_with_stdio(0);
	cin.tie(0);
    
    vector<pair<vector<pair<int, int>>, int>> railwayEmpires;
    int vertex, cases;
    cin >> vertex >> cases;

    while (vertex != 0 && cases != 0) {
        vector<pair<int, int>> railway;
        int u, v;
        while (true) {
            cin >> u >> v;
            if (u == -1 && v == -1) break;
            railway.push_back({u, v});
        }
        railwayEmpires.push_back({railway, cases});
        cin >> vertex >> cases;
    }

    for (auto &railway : railwayEmpires) {
        auto adjacencyList = adjacencies(railway.first);
        auto cutVertex = cutVertices(adjacencyList, railway.second);
        for (int i = 0; i < railway.second; ++i) {
            cout << cutVertex[i].first << " " << cutVertex[i].second << endl;
        }
        cout << endl;
    }

    return 0;
}
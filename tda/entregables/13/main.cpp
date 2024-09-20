#include <iostream>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <queue>
#include <limits>

using namespace std;

class FlowNetwork {
private:
    unordered_map<string, unordered_map<string, int>> graph;
    unordered_map<string, unordered_map<string, int>> residual_graph;

public:
    void add_node(string node) {
        if (graph.find(node) == graph.end()) {
            graph[node] = {};
            residual_graph[node] = {};
        }
    }

    void add_edge(string origin, string destination, int capacity) {

        graph[origin][destination] = capacity;

        residual_graph[origin][destination] = capacity;
        residual_graph[destination][origin] = 0;
    }

    bool bfs(string source, string sink, unordered_map<string, string>& parent) {
        unordered_set<string> visited;
        queue<string> q;
        q.push(source);
        visited.insert(source);

        while (!q.empty()) {
            string current_node = q.front();
            q.pop();

            for (auto& neighbor : residual_graph[current_node]) {
                if (visited.find(neighbor.first) == visited.end() && residual_graph[current_node][neighbor.first] > 0) {
                    q.push(neighbor.first);
                    visited.insert(neighbor.first);
                    parent[neighbor.first] = current_node;
                    if (neighbor.first == sink) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    int ford_fulkerson(string source, string sink) {
        int max_flow = 0;
        unordered_map<string, string> parent;

        while (bfs(source, sink, parent)) {

            int path_flow = numeric_limits<int>::max();
            string s = sink;

            while (s != source) {
                path_flow = min(path_flow, residual_graph[parent[s]][s]);
                s = parent[s];
            }

            string v = sink;
            while (v != source) {
                string u = parent[v];
                residual_graph[u][v] -= path_flow;
                residual_graph[v][u] += path_flow;
                v = parent[v];
            }

            max_flow += path_flow;

            parent.clear();
        }

        return max_flow;
    }

    void reset_graph() {
        graph.clear();
        residual_graph.clear();
    }
};

int main() {
    int cases;
    cin >> cases;

    for (int k = 0; k < cases; ++k) {
        FlowNetwork fn;
        fn.add_node("s");
        fn.add_node("XXL");
        fn.add_node("XL");
        fn.add_node("L");
        fn.add_node("M");
        fn.add_node("S");
        fn.add_node("XS");
        fn.add_node("t");
        
        int shirts, volunteers;
        cin >> shirts >> volunteers;
        
        vector<string> sizes = {"XXL", "XL", "L", "M", "S", "XS"};
        for (int tshirtSize = 0; tshirtSize < 6; ++tshirtSize) {
            fn.add_edge("s", sizes[tshirtSize], shirts / 6);
        }
        
        for (int i = 0; i < volunteers; ++i) {
            fn.add_node("v" + to_string(i));
            string s1, s2;
            cin >> s1 >> s2;
            fn.add_edge(s1, "v" + to_string(i), 1);
            fn.add_edge(s2, "v" + to_string(i), 1);
            fn.add_edge("v" + to_string(i), "t", 1);
        }
        
        int max_flow = fn.ford_fulkerson("s", "t");
        if (max_flow == volunteers) {
            cout << "YES" << endl;
        } else {
            cout << "NO" << endl;
        }
        fn.reset_graph();
    }

    return 0;
}
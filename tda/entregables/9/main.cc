#include <iostream>
#include <vector>
#include <unordered_map>
#include <queue>
#include <algorithm>

using namespace std;

int cost(string a, string b) {
    int totalCost = 0;
    for (int i = 0; i < 4; ++i) {
        int digitA = a[i] - '0';
        int digitB = b[i] - '0';
        totalCost += min(abs(digitA - digitB), 10 - abs(digitA - digitB));
    }
    return totalCost;
}

int agmin_prim(string start_vertex, unordered_map<string, bool>& visited, vector<string>& keys) {
    priority_queue<pair<int, pair<string, string>>, vector<pair<int, pair<string, string>>>, greater<pair<int, pair<string, string>>>> min_heap;
    vector<pair<string, string>> agm;
    int agm_weight = 0;

    auto add_edges = [&](string node) {
        visited[node] = true;
        for (const auto& neighbor : keys) {
            if (neighbor != node && !visited[neighbor]) {
                int edgeCost = cost(node, neighbor);
                min_heap.push({edgeCost, {node, neighbor}});
            }
        }
    };

    add_edges(start_vertex);

    while (!min_heap.empty()) {
        auto top = min_heap.top();
        min_heap.pop();
        auto node1 = top.second.first;
        auto node2 = top.second.second;
        if (!visited[node2]) {
            visited[node2] = true;
            agm.push_back({node1, node2});
            agm_weight += top.first;
            add_edges(node2);
        }
    }

    return agm_weight;
}

int main() {
    
    ios_base::sync_with_stdio(0);
	cin.tie(0);
    
    int cases;
    cin >> cases;

    vector<pair<int, vector<string>>> test_cases;
    for (int i = 0; i < cases; ++i) {
        int num_keys;
        cin >> num_keys;
        vector<string> keys(num_keys);
        for (int j = 0; j < num_keys; ++j) {
            cin >> keys[j];
        }
        test_cases.push_back({num_keys, keys});
    }

    vector<int> rolls;
    for (const auto& [num_keys, keys] : test_cases) {
        vector<pair<string, int>> zero_cost_list;
        for (const auto& vertex : keys) {
            zero_cost_list.push_back({vertex, cost("0000", vertex)});
        }
        auto min_edge = min_element(zero_cost_list.begin(), zero_cost_list.end(), [](const pair<string, int>& a, const pair<string, int>& b) {
            return a.second < b.second;
        });
        int min_weight = min_edge->second;

        unordered_map<string, bool> visited;
        vector<string> keys_copy = keys;
        int agm_weight = agmin_prim(min_edge->first, visited, keys_copy);
        rolls.push_back(agm_weight + min_weight);
    }

    for (int r : rolls) {
        cout << r << endl;
    }

    return 0;
}
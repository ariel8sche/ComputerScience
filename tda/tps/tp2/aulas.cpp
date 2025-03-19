#include <iostream>
#include <vector>
#include <queue>
#include <string>
#include <sstream>

using namespace std;

vector<long long> bfs(long long start, const vector<long long>& tunnels) {
    queue<long long> q;
    vector<bool> visited(tunnels.size(), false);
    vector<long long> energy(tunnels.size(), 0);
    
    q.push(start);
    visited[start] = true;
    
    while (!q.empty()) {
        long long currentNode = q.front();
        q.pop();
        
        if (currentNode + 1 < tunnels.size() && !visited[currentNode + 1]) {
            q.push(currentNode + 1);
            visited[currentNode + 1] = true;
            energy[currentNode + 1] = energy[currentNode] + 1;
        }
        
        long long tunnel_destination = tunnels[currentNode] - 1;
        if (tunnel_destination != currentNode && !visited[tunnel_destination]) {
            q.push(tunnel_destination);
            visited[tunnel_destination] = true;
            energy[tunnel_destination] = energy[currentNode] + 1;
        }
    }
    
    return energy;
}

int main() {
    long long n;
    cin >> n;
    
    vector<long long> tunnels(n);
    for (long long i = 0; i < n; ++i) {
        cin >> tunnels[i];
    }
    
    vector<long long> res = bfs(0, tunnels);

    for (long long i = 0; i < res.size(); ++i) {
        if (i > 0) cout << " ";
        cout << res[i];
    }
    cout << endl;
    
    return 0;
}

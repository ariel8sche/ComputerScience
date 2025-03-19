#include <iostream>
#include <vector>
#include <climits>
#include <cstdio>
using namespace std;

int main() {
    std::ios_base::sync_with_stdio(false);
    cin.tie(NULL);

    int corner;
    scanf("%d", &corner);

    vector<vector<long long>> distances(corner, vector<long long>(corner));
    for (int i = 0; i < corner; i++) {
        for (int j = 0; j < corner; j++) {
            scanf("%lld", &distances[i][j]);
        }
    }

    vector<int> order(corner);
    for (int i = 0; i < corner; i++) {
        scanf("%d", &order[i]);
    }

    vector<long long> res;
    vector<bool> active_corner(corner, false);

    vector<vector<long long>> current_distances = distances;

    for (int idx = corner - 1; idx >= 0; idx--) {
        int node = order[idx] - 1;
        active_corner[node] = true;

        for (int i = 0; i < corner; i++) {
            for (int j = 0; j < corner; j++) {
                current_distances[i][j] = min(current_distances[i][j], 
                                              current_distances[i][node] + current_distances[node][j]);
            }
        }

        long long sum_dist = 0;
        for (int i = 0; i < corner; i++) {
            if (active_corner[i]) {
                for (int j = 0; j < corner; j++) {
                    if (active_corner[j] && i != j) {
                        sum_dist += current_distances[i][j];
                    }
                }
            }
        }

        res.push_back(sum_dist);
    }

    for (int i = res.size() - 1; i >= 0; i--) {
        printf("%lld\n", res[i]);
    }

    return 0;
}
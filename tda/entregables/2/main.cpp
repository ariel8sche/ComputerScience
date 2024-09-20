#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int creciente(int buildings_q, vector<pair<int, int>>& sector, vector<int>& mem) {
    int max_val = 0;
    if (buildings_q == 0)
        return 0;
    if (buildings_q == 1)
        return sector[0].second;
    for (int i = 0; i < buildings_q; ++i) {
        mem[i] = sector[i].second;
        for (int j = 0; j < i; ++j) {
            if (sector[j].first < sector[i].first && sector[i].second + mem[j] > mem[i]) {
                mem[i] = sector[i].second + mem[j];
            }
        }
        if (mem[i] > mem[max_val]) {
            max_val = i;
        }
    }
    return mem[max_val];
}

int decreciente(int buildings_q, vector<pair<int, int>>& sector, vector<int>& mem) {
    int max_val = 0;
    if (buildings_q == 0)
        return 0;
    if (buildings_q == 1)
        return sector[0].second;
    for (int i = 0; i < buildings_q; ++i) {
        mem[i] = sector[i].second;
        for (int j = 0; j < i; ++j) {
            if (sector[j].first > sector[i].first && sector[i].second + mem[j] > mem[i]) {
                mem[i] = sector[i].second + mem[j];
            }
        }
        if (mem[i] > mem[max_val]) {
            max_val = i;
        }
    }
    return mem[max_val];
}

int main() {
    int case_count;
    cin >> case_count;
    vector<vector<pair<int, int>>> mem(case_count);
    for (int i = 0; i < case_count; i++) {
        int building_q;
        cin >> building_q;
        vector<int> heights(building_q);
        vector<int> widths(building_q);
        for (int j = 0; j < building_q; j++) {
            cin >> heights[j];
        }
        for (int j = 0; j < building_q; j++) {
            cin >> widths[j];
        }
        vector<pair<int, int>> sector(building_q);
        for (int j = 0; j < building_q; j++) {
            sector[j] = make_pair(heights[j], widths[j]);
        }
        mem[i] = sector;
    }
    vector<pair<int, int>> skyline_status;
    for (int i = 0; i < case_count; ++i) {
        int q = mem[i].size();
        vector<int> cre_mem(q, 0);
        vector<int> dec_mem(q, 0);
        int cre_val = creciente(q, mem[i], cre_mem);
        int dec_val = decreciente(q, mem[i], dec_mem);
        skyline_status.push_back({cre_val, dec_val});
        if (skyline_status[i].first >= skyline_status[i].second) {
            cout << "Case " << i + 1 << ". Increasing (" << skyline_status[i].first << "). Decreasing (" << skyline_status[i].second << ")." << endl;
        } else {
            cout << "Case " << i + 1 << ". Decreasing (" << skyline_status[i].second << "). Increasing (" << skyline_status[i].first << ")." << endl;
        }
    }
    return 0;
}
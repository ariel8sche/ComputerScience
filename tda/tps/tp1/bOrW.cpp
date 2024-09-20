#include <iostream>
#include <vector>
#include <limits>
#include <algorithm>

using namespace std;

int bOrW(vector<int>& s, int i, int b, int w, vector<vector<vector<int>>>& mem) {
    if (i == s.size()) {
        return 0;
    }

    if (mem[i][b + 1][w + 1] != -1) {
        return mem[i][b + 1][w + 1];
    }

    int unpainted = bOrW(s, i + 1, b, w, mem) + 1;

    int black = numeric_limits<int>::max();
    if (b == -1 || s[i] > s[b]) {
        black = bOrW(s, i + 1, i, w, mem);
    }

    int white = numeric_limits<int>::max();
    if (w == -1 || s[i] < s[w]) {
        white = bOrW(s, i + 1, b, i, mem);
    }

    int res = min({unpainted, black, white});
    mem[i][b + 1][w + 1] = res;
    return res;
}

int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);

    int n;
    cin >> n;
    while (n != -1) {
        vector<int> sequence(n);
        for (int i = 0; i < n; ++i) {
            cin >> sequence[i];
        }

        vector<vector<vector<int>>> mem(n, vector<vector<int>>(n + 1, vector<int>(n + 1, -1)));
        cout << bOrW(sequence, 0, -1, -1, mem) << endl;

        cin >> n;
    }
    return 0;
}

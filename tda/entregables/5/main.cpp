#include <iostream>
#include <vector>
#include <cmath>

using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);cout.tie(NULL);
    
    long long int houses;
    cin >> houses;
    vector<vector<int>> city;

    while (houses != 0) {
        vector<int> street(houses);
        for (int i = 0; i < houses; ++i) {
            cin >> street[i];
        }
        city.push_back(street);
        cin >> houses;
    }

    for (auto& street : city) {
        long long int s = 0;
        long long int b = 0;
        long long int work = 0;
        while (true) {
            while (s < street.size() && street[s] >= 0) {
                ++s;
            }
            while (b < street.size() && street[b] <= 0) {
                ++b;
            }
            if (s == street.size() || b == street.size()) {
                break;
            } else {
                long long int min_wine = min(street[b], -street[s]);
                work += min_wine * abs(s - b);
                street[b] -= min_wine;
                street[s] += min_wine;
            }
        }
        cout << work << endl;
    }
    return 0;
}

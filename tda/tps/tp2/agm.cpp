#include <iostream>
#include <vector>
#include <unordered_map>
#include <queue>
#include <set>
#include <tuple>
#include <algorithm>
#include <functional>

using namespace std;

struct hash_pair {
    template <class T1, class T2>
    size_t operator()(const pair<T1, T2>& p) const {
        auto hash1 = hash<T1>{}(p.first);
        auto hash2 = hash<T2>{}(p.second);
        return hash1 ^ (hash2 << 1); // Combina los dos hashes
    }
};

long long pesarArista(long long nodo1, long long nodo2, unordered_map<pair<long long, long long>, long long, hash_pair>& pesos) {
    if (pesos.count({nodo1, nodo2})) return pesos[{nodo1, nodo2}];
    return pesos[{nodo2, nodo1}];
}

pair<vector<pair<long long, long long>>, vector<long long>> prim(long long v, long long num_vertices, unordered_map<long long, vector<long long>>& adj, unordered_map<pair<long long, long long>, long long, hash_pair>& pesos) {
    vector<bool> visitados(num_vertices, false);
    priority_queue<tuple<long long, long long, long long>, vector<tuple<long long, long long, long long>>, greater<>> minheap;
    vector<pair<long long, long long>> agm;
    vector<long long> padres(num_vertices, -1);

    auto añadirVertice = [&](long long nodo) {
        visitados[nodo] = true;
        for (auto vecino : adj[nodo]) {
            if (!visitados[vecino]) {
                minheap.emplace(pesarArista(nodo, vecino, pesos), nodo, vecino);
            }
        }
    };

    añadirVertice(v);
    while (!minheap.empty()) {
        auto [peso, origen, destino] = minheap.top();
        minheap.pop();
        if (!visitados[destino]) {
            agm.emplace_back(min(origen, destino), max(origen, destino));
            padres[destino] = origen;
            añadirVertice(destino);
        }
    }
    return {agm, padres};
}

vector<pair<long long, long long>> aristas_no_en_agm(vector<pair<long long, long long>>& aristas, vector<pair<long long, long long>>& agm) {
    set<pair<long long, long long>> conjunto_agm(agm.begin(), agm.end());
    vector<pair<long long, long long>> aristas_fuera_agm;
    for (auto& arista : aristas) {
        if (conjunto_agm.find(arista) == conjunto_agm.end()) {
            aristas_fuera_agm.push_back(arista);
        }
    }
    return aristas_fuera_agm;
}

vector<long long> calcular_niveles(vector<long long>& padres) {
    long long n = padres.size();
    vector<long long> niveles(n, -1);

    function<long long(long long)> nivel = [&](long long nodo) {
        if (niveles[nodo] != -1) return niveles[nodo];
        if (padres[nodo] == -1) niveles[nodo] = 0;
        else niveles[nodo] = nivel(padres[nodo]) + 1;
        return niveles[nodo];
    };

    for (long long i = 0; i < n; ++i) nivel(i);

    return niveles;
}

vector<pair<long long, long long>> ciclos(long long v1, long long v2, vector<long long>& padres, vector<long long>& nivel, vector<pair<long long, long long>> ciclo) {
    if (nivel[v1] == nivel[v2] && v1 == v2) return ciclo;
    long long maxV, minV;
    if (nivel[v1] > nivel[v2]) maxV = v1, minV = v2;
    else maxV = v2, minV = v1;

    while (nivel[maxV] != nivel[minV]) {
        ciclo.emplace_back(min(maxV, padres[maxV]), max(maxV, padres[maxV]));
        maxV = padres[maxV];
    }
    while (maxV != minV) {
        ciclo.emplace_back(min(maxV, padres[maxV]), max(maxV, padres[maxV]));
        ciclo.emplace_back(min(minV, padres[minV]), max(minV, padres[minV]));
        maxV = padres[maxV];
        minV = padres[minV];
    }
    return ciclo;
}

vector<pair<long long, long long>> aristas_con_peso(vector<pair<long long, long long>>& aristas, unordered_map<pair<long long, long long>, long long, hash_pair>& pesos, long long peso_objetivo) {
    vector<pair<long long, long long>> resultado;
    for (auto& arista : aristas) {
        if (pesarArista(arista.first, arista.second, pesos) == peso_objetivo) {
            resultado.push_back(arista);
        }
    }
    return resultado;
}

int main() {
    long long vertices, numAristas;
    cin >> vertices >> numAristas;
    vector<string> clasificacion(numAristas, "none");
    unordered_map<long long, vector<long long>> adj;
    vector<pair<long long, long long>> aristas;
    unordered_map<pair<long long, long long>, long long, hash_pair> pesos;
    unordered_map<pair<long long, long long>, long long, hash_pair> orden;

    for (long long i = 0; i < numAristas; ++i) {
        long long node1, node2, p;
        cin >> node1 >> node2 >> p;
        node1--, node2--;
        adj[node1].push_back(node2);
        adj[node2].push_back(node1);
        pair<long long, long long> arista_ordenada = {min(node1, node2), max(node1, node2)};
        aristas.push_back(arista_ordenada);
        orden[arista_ordenada] = i;
        pesos[arista_ordenada] = p;
    }

    auto [agmAristas, padres] = prim(aristas[0].first, vertices, adj, pesos);
    for (auto& v : agmAristas) {
        clasificacion[orden[v]] = "any";
    }
    auto otrasAristas = aristas_no_en_agm(aristas, agmAristas);
    auto nivelAGM = calcular_niveles(padres);
    for (auto& e : otrasAristas) {
        vector<pair<long long, long long>> ciclo = ciclos(e.first, e.second, padres, nivelAGM, {e});
        auto aristasConMismoPeso = aristas_con_peso(ciclo, pesos, pesos[e]);
        if (aristasConMismoPeso.size() > 1) {
            for (auto& c : aristasConMismoPeso) {
                clasificacion[orden[c]] = "at least one";
            }
        }
    }

    for (long long i = 0; i < numAristas; ++i) {
        cout << clasificacion[i] << endl;
    }

    return 0;
}

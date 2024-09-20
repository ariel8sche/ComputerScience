def main():
    cases = int(input())
    forest = []
    tree_acorn_q = []
    for case in range(0, cases):
        d = input()
        data = d.split()
        trees = int(data[0])
        treeHeight = int(data[1])
        timeLose = int(data[2])
        sector = [[0 for _ in range(trees)]for _ in range(treeHeight)]
        for i in range(trees):
            acorns = input()
            acorns = acorns.split()
            acorn_q = int(acorns[0])
            acorns = acorns[1:]
            tree_acorn_q.append(acorn_q)
            for acorn in acorns:
                sector[int(acorn) -1][i] = sector[int(acorn) -1][i] + 1
        forest.append(sector)
    return forest     

print(main())
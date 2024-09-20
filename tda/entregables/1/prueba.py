def sublist_att_sort(sublist):
    return sorted(sublist, key=lambda x: (x[1], -x[2]), reverse=True)

def att_sort(lista, case):
    if case > 1:
        o_list = [sublist_att_sort(sublist) for sublist in lista]
    else:
        o_list = sorted(lista, key=lambda x: (x[1], -x[2]), reverse=True)
    return o_list

list = [[
    ['sidky', 16, 36], 
    ['shamim', 16, 18], 
    ['shadowcoder', 12, 9], 
    ['muntasir', 13, 4], 
    ['brokenarrow', 16, 16], 
    ['tanaeem', 20, 97], 
    ['sohelh', 18, 9], 
    ['sameezahur', 20, 21], 
    ['jaan', 17, 86], 
    ['emotionalblind', 16, 12]
],[
    ['dario', 16, 36], 
    ['kevin', 16, 18], 
    ['miguel', 12, 9], 
    ['lautaro', 13, 4], 
    ['sergio', 16, 16], 
    ['luca', 20, 97], 
    ['ezequiel', 18, 9], 
    ['cristian', 20, 21], 
    ['aaron', 17, 86], 
    ['marcos', 16, 12]
]]


list4 = [
            [
                ['emotionalblind', 16, 12], 
                ['jaan', 17, 86], 
                ['sameezahur', 20, 21], 
                ['sohelh', 18, 9], 
                ['tanaeem', 20, 97]
            ], 
            [
                ['brokenarrow', 16, 16],
                ['muntasir', 13, 4],
                ['shadowcoder', 12, 9],
                ['shamim', 16, 18],
                ['sidky', 16, 36]
            ]
        ]

vjudge = [[['a', 20, 20], ['g', 20, 20], ['h', 20, 20], ['i', 20, 20], ['j', 20, 20]], [['b', 20, 20], ['c', 20, 20], 
['d', 20, 20], ['e', 20, 20], ['f', 20, 20]], [['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['b', 69, 69]], [['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['z', 69, 69]]]


#print(att_sort(vjudge, 2))

list2 = [
            [['sameezahur', 20, 21], ['tanaeem', 20, 97], ['sohelh', 18, 9], ['jaan', 17, 86], ['emotionalblind', 16, 12], ['brokenarrow', 16, 16], ['shamim', 16, 18], ['sidky', 16, 36], ['muntasir', 13, 4], ['shadowcoder', 12, 9]], 
            [['cristian', 20, 21], ['luca', 20, 97], ['ezequiel', 18, 9], ['aaron', 17, 86], ['marcos', 16, 12], ['sergio', 16, 16], ['kevin', 16, 18], ['dario', 16, 36], ['lautaro', 13, 4], ['miguel', 12, 9]]
        ]

def split_pos(lista, case):
    pos = [[[None for _ in range(3)] for _ in range(5)] for _ in range(2*case)]
    for i in range(case):
        for j in range(5):
            for k in range(3):
                pos[2*i][j] = lista[i][j]
                pos[2*i+1][j] = lista[i][j+5]
    return pos

#print(split_pos(list2, 2))

list3 = [
            [['sameezahur', 20, 21], ['tanaeem', 20, 97], ['sohelh', 18, 9], ['jaan', 17, 86], ['emotionalblind', 16, 12]], 
            [['brokenarrow', 16, 16], ['shamim', 16, 18], ['sidky', 16, 36], ['muntasir', 13, 4], ['shadowcoder', 12, 9]], 
            [['cristian', 20, 21], ['luca', 20, 97], ['ezequiel', 18, 9], ['aaron', 17, 86], ['marcos', 16, 12]], 
            [['sergio', 16, 16], ['kevin', 16, 18], ['dario', 16, 36], ['lautaro', 13, 4], ['miguel', 12, 9]]
        ]

def sublist_alfa_sort(sublist):
    return sorted(sublist, key=lambda x: x[0])

def alfa_sort(lista, case):
    if case > 1:
        o_a_list = [sublist_alfa_sort(sublist) for sublist in lista]
    else:
        o_a_list = sorted(lista, key=lambda x: x[0])
    return o_a_list

#print(alfa_sort(list3, 2))


def printer(lista, case):
    for i in range (0, case, 1):
        resultado = f"Case {i+1}:\n({lista[2*i][0][0]}, {lista[2*i][1][0]}, {lista[2*i][2][0]}, {lista[2*i][3][0]}, {lista[2*i][4][0]})\n({lista[2*i+1][0][0]}, {lista[2*i+1][1][0]}, {lista[2*i+1][2][0]}, {lista[2*i+1][3][0]}, {lista[2*i+1][4][0]})"
        print(resultado)

ejemplo1 = [[['emotionalblind', 16, 12], ['jaan', 17, 86], ['sameezahur', 20, 21], ['sohelh', 18, 9], ['tanaeem', 20, 97]], [['brokenarrow', 16, 16], ['muntasir', 13, 4], ['shadowcoder', 12, 9], ['shamim', 16, 18], ['sidky', 16, 36]]]

ejemplo2 = [[['a', 20, 20], ['b', 20, 20], ['c', 20, 20], ['d', 20, 20], ['e', 20, 20]], [['f', 20, 20], ['g', 20, 20], ['h', 20, 20], ['i', 20, 20], ['j', 20, 20]], [['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['a', 69, 69]], [['a', 69, 69], ['a', 69, 69], ['a', 69, 69], ['b', 69, 69], ['z', 69, 69]]]

printer(ejemplo2, 2)




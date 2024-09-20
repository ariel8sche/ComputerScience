def sublist_att_sort(sublist):
    return sorted(sublist, key=lambda x: (-x[1], x[2], x[0]))

def att_sort(lista, case):
    o_list = [sublist_att_sort(sublist) for sublist in lista]
    return o_list

def split_pos(lista, case):
    pos = [[[None for _ in range(3)] for _ in range(5)] for _ in range(2*case)]
    for i in range(case):
        for j in range(5):
            for k in range(3):
                pos[2*i][j][k] = lista[i][j][k]
                pos[2*i+1][j][k] = lista[i][j+5][k]
    return pos

def sublist_alfa_sort(sublist):
    return sorted(sublist, key=lambda x: x[0])

def alfa_sort(lista, case):
    o_a_list = [sublist_alfa_sort(sublist) for sublist in lista]
    return o_a_list

def formation(lista, case):
    lista1 = att_sort(lista, case)
    lista2 = split_pos(lista1, case)
    lista3 = alfa_sort(lista2, case)
    return lista3

def printer(container, caseO):
    for i in range (0, caseO, 1):
        resultado = f"Case {i+1}:\n({container[2*i][0][0]}, {container[2*i][1][0]}, {container[2*i][2][0]}, {container[2*i][3][0]}, {container[2*i][4][0]})\n({container[2*i+1][0][0]}, {container[2*i+1][1][0]}, {container[2*i+1][2][0]}, {container[2*i+1][3][0]}, {container[2*i+1][4][0]})"
        print(resultado)

def take_list(): 
    player_list = []
    another_list = []
    container = []
    case = int(input())
    caseO = case
    for i in range(0, case*10, 1):
        player = input()
        player_list.append(player)
    while case > 0:
        for i in range (10):
            element = player_list.pop(0)
            element = element.split()
            element[0] = str(element[0])
            element[1] = int(element[1])
            element[2] = int(element[2])
            another_list.append(element)
        container.append(another_list)
        another_list = []
        case-=1
    container = formation(container, caseO)
    return printer(container, caseO)

take_list()
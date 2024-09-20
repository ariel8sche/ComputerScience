# Técnica Top-Down

# def subset_sum(conjunto, i, j, mem):
#     if j < 0:
#         return False
#     if i == 0:
#         return j == 0
#     if mem[i][j] == None:
#         if conjunto[i-1] > j:
#             mem[i][j] = subset_sum(conjunto, i-1, j, mem)
#         else:
#             mem[i][j] = subset_sum(conjunto, i-1, j, mem) or subset_sum(conjunto, i-1, j-conjunto[i-1],mem)
#     return mem[i][j]

# print(subset_sum([6,11,6],3,12,[[None for _ in range(13)] for _ in range(4)]))

# Técnica Bottom-Up

def subset_sum(C, k):
    mem = [[False] * (k + 1) for _ in range(len(C) + 1)]

    for j in range(k+1):
        mem[0][j] = j == 0
        
    for i in range (1,len(C)+1):
        for j in range (k+1):
            if C[i-1] <= j: 
                mem[i][j] = mem[i-1][j] or mem[i-1][j-C[i-1]]
            else: 
                mem[i][j] = mem[i-1][j]
                
    return mem[len(C)][k]

print(subset_sum([6,12,6],12))
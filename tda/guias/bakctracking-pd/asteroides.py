def mgn(c,j,mem,list):
    if (c < 0 or c > j):
        return float('-inf')
    if (c==0 and j== 0):
        return 0
    if mem[c][j] != None:
        return mem[c][j]
    else:
        mem[c][j] = max(mgn(c-1,j-1,mem,list)-list[j-1], mgn(c+1,j-1,mem,list)+list[j-1], mgn(c,j-1,mem,list))
    return mem[c][j]

mem = [[None for _ in range (5)] for _ in range (5)]
list = [3,2,5,6]
print(mgn(0,4,mem, list))
duration = [2,4,5]

#Brute Force
def cd_BT(i, k):
    if (i==-1):
        return 0
    if (duration[i] > k):
        return cd_BT(i-1,k)
    else:
        return max(cd_BT(i-1,k),cd_BT(i-1,k-duration[i])+duration[i])
    
#print(cd_BT(2,8))

duration = [2,4,5]

mem = [[None for _ in range (8)]for _ in range (3)]

def cd_TD(i, k, mem, duration):
    if (i==-1):
        return 0
    if (mem[i][k-1] == None):
        if (duration[i]>k):
            mem[i][k-1] =cd_TD(i-1,k, mem, duration)
        else:
            if k-duration[i] < 0:
                mem[i][k-1] = cd_TD(i-1,k, mem, duration)
            else:
                mem[i][k-1] = max(cd_TD(i-1,k, mem, duration),cd_TD(i-1,k-duration[i], mem, duration)+duration[i])
    return mem[i][k-1]

#print(cd_TD(2, 6, mem, duration))

duration = [2,4,5]

mem = [[0 for _ in range (9)]for _ in range (len(duration)+1)]

def cd_BU(n, K, mem, duration):
    for i in range(1, n+1):
        for k in range(1, K+1):
            if (duration[i-1] > k):
                mem[i][k] = mem[i-1][k]
            else:
                mem[i][k] = max(mem[i-1][k], mem[i-1][k-duration[i-1]] + duration[i-1])
    return mem[n][K]

print(cd_BU(len(duration), 8, mem, duration))
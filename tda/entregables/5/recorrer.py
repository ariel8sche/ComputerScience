def walk(mem):
    work = 0
    for i in range(0, len(mem)):
        if mem[i] == 0:
            None
        elif mem[i] > 0:
            for j in range(i+1, len(mem)):
                if mem[i] == 0:
                    None
                elif mem[j] < 0 and mem[j] >= -mem[i]:
                    work += (j-i) * -mem[j]
                    mem[i] += mem[j]
                    mem[j] = 0
                elif mem[j] < -mem[i]:
                    work += (j-i) * mem[i]
                    mem[j] += mem[i]
                    mem[i] = 0
                else:
                    None
        else:
            for j in range(i+1, len(mem)):
                if mem[i] == 0:
                    None
                elif mem[j] > 0 & mem[j] <= -mem[i]:
                    work += (j-i) * mem[j]
                    mem[i] += mem[j]
                    mem[j] = 0
                elif mem[j] > -mem[i]:
                    work = (j-i) * mem[i]
                    mem[j] += mem[i]
                    mem[i] = 0
                else:
                    None
    return work
                
#print(walk([5, -4, 1, -3, 1]))
print(walk([-1000, -1000, -1000, 1000, 1000, 1000]))
                
                
                

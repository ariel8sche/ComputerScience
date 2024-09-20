# def parejasDeBaile(c, q, i, j, p):
#     if i == len(c) or j == len(q):
#         return p
#     elif abs(c[i]-q[j]) <= 1:
#         return parejasDeBaile(c, q, i+1, j+1, p+1)
#     elif (c[i] < q[j]):
#         return parejasDeBaile(c, q, i+1, j, p)
    
#     return parejasDeBaile(c, q, i, j+1, p)

def parejasDeBaile(c, q):
    i=0
    j=0
    p=0
    while (i < len(c) and j < len(q)):
        if abs(c[i]-q[j]) <= 1:
            i+=1
            j+=1
            p+=1
        elif (c[i] < q[j]):
            i+=1
        else:
            j+=1
        
    return p
    
print(parejasDeBaile([1,1,1,1],[1,1,1,1]))
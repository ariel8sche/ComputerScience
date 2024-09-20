def pilaCauta(w, s, i, k):
    n = len(w)
    if i == n:
        return 0
    if w[i] < s[k]:
        return max(pilaCauta(w,s,i+1,i)+1,pilaCauta(w,s,i+1,k))
    else:
        return pilaCauta(w,s,i+1,k)
    
print(pilaCauta([19, 7, 5, 6, 1], [15, 13, 7, 8, 2], 0, 0))
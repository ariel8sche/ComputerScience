

def main():
    cases = int(input())

    for case in range(1, cases+1):
        buildings_q = int(input())
        
        height = list(map(int, input().split()))
        width = list(map(int, input().split()))
        
        mem = [0]*buildings_q
        best = 0
        
        for i in range(buildings_q):
            mem[i] = width[i]
            
            for j in range(i):
                if height[j] < height[i] and width[i] + mem[j] > mem[i]:
                    mem[i] = width[i] + mem[j]
            
            if mem[i] > mem[best]:
                best = i
        
        A = mem[best]
        
        best = 0
        
        for i in range(buildings_q):
            mem[i] = width[i]
            
            for j in range(i):
                if height[j] > height[i] and width[i] + mem[j] > mem[i]:
                    mem[i] = width[i] + mem[j]
            
            if mem[i] > mem[best]:
                best = i
        
        B = mem[best]
        
        if A >= B:
            print(f"Case {case}. Increasing ({A}). Decreasing ({B}).")
        else:
            print(f"Case {case}. Decreasing ({B}). Increasing ({A}).")

main()
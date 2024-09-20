def main():
    st1 = list(str(input()))
    st2 = list(str(input()))
    def divide(st1, st2):
        if (st1 == st2):
            return True
        elif len(st1) % 2 == 1:
            return False
        else:
            mid1 = len(st1) // 2
            return ((divide(st1[mid1:],st2[:mid1]) and divide(st1[:mid1],st2[mid1:])) or (divide(st1[mid1:],st2[mid1:]) and divide(st1[:mid1],st2[:mid1]))) 
    res = divide(st1, st2)
    if res == True:
        print("YES")
    else:
        print("NO")
    
main()
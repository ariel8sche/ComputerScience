def nkapsack(maxWeight:int, items:int, profit:list, weight:list):
    if maxWeight < 0:
        return float('-inf')
    elif maxWeight == 0 or items == 0:
        return 0
    else:
        return max(nkapsack(maxWeight, items-1, profit, weight), nkapsack(maxWeight - weight[items-1], items-1, profit, weight) + profit[items-1])
    
def cd(minutes:int, songs:int, songsDuration:list):
    if minutes < 0:
        return (float('-inf'))
    elif minutes == 0 or songs == 0:
        return 0
    else:
        return max(cd(minutes, songs-1, songsDuration), cd(minutes-songsDuration[songs-1], songs-1, songsDuration) + songsDuration[songs-1])
        
# print(cd(7,3,[1,4,1]))


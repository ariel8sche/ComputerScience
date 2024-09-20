# Python program for implementation of MergeSort

def merge(arr1,arr2):
    i=0
    j=0
    result=[]
    while(i<len(arr1) and j<len(arr2)):
        if arr2[j]>arr1[i]:
            result.append(arr1[i])
            i+=1
        else:
            result.append(arr2[j])
            j+=1
    while(i<len(arr1)):
        result.append(arr1[i])
        i+=1
    while(j<len(arr2)):
        result.append(arr2[j])
        j+=1
    
    return result
    
def mergeSort(arr):
    if len(arr)<=1:
        return arr
    mid = len(arr)//2
    left = mergeSort(arr[:mid])
    right = mergeSort(arr[mid:])
    
    return merge(left,right)
 
def sumaSelectivaMergeSort(lista, k):
    res=[]
    lista = mergeSort(lista)
    for i in range(len(lista)-1, len(lista)-1-k, -1):
        res.append(lista[i])
    return sum(res)

print(sumaSelectivaMergeSort([4,5,7,3,8,3,9], 4))

def heapify(lst, n, i):
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2

    if left < n and lst[i] < lst[left]:
        largest = left

    if right < n and lst[largest] < lst[right]:
        largest = right

    if largest != i:
        lst[i], lst[largest] = lst[largest], lst[i]
        heapify(lst, n, largest)

def build_max_heap(lst):
    n = len(lst)

    for i in range(n//2 - 1, -1, -1):
        heapify(lst, n, i)

    return lst


def sumaSelectivaHeapSort(lista, k):
    res=[]
    lista = build_max_heap(lista)
    for i in range(k):
        res.append(lista[0])
        lista[0] = lista[len(lista)-1]
        lista.pop()
        lista = build_max_heap(lista)
    return sum(res)

print(sumaSelectivaHeapSort([4,5,7,3,8,3,9], 4))
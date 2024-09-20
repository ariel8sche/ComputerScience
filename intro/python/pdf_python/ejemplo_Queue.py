from queue import Queue

cola = Queue()
print(cola.empty())

## checking whether cola is empty or not -> true
print(cola.empty())

## pushing the elements
cola.put(1)
cola.put(2)
cola.put(3)
cola.put(4)
cola.put(5)

## again checking whether cola is empty or not -> false
print(cola.empty())

## popping all the elements
print(cola.get())
print(cola.get())
print(cola.get())

## checking the cola size
print("Size", cola.qsize())

print(cola.get())
print(cola.get())
 
## checking the whether cola is empty or not for the last time -> true
print(cola.empty())
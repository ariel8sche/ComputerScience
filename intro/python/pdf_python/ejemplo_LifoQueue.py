from queue import LifoQueue

pila = LifoQueue()
print(pila.empty())

## checking whether pila is empty or not -> true
print(pila.empty())

## pushing the elements
pila.put(1)
pila.put(2)
pila.put(3)
pila.put(4)
pila.put(5)

## again checking whether pila is empty or not -> false
print(pila.empty())

## popping all the elements
print(pila.get())
print(pila.get())
print(pila.get())

## checking the pila size
print("Size", pila.qsize())

print(pila.get())
print(pila.get())
 
## checking the whether pila is empty or not for the last time -> true
print(pila.empty())
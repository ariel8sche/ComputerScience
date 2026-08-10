import numpy as np

""" #1 + 3
a = 7
b = a +1
print("a =",a)
print("b =",b) """

# Vectores
print("\nVectores\n")
v = np.array([1,2,3,-1])
w = np.array([2,3,0,5])
print("v =", v)
print("w =", w)
print("v + w =",v + w)
print("2*v =",2*v)
print("v**2 =",v**2)

# Matrices
print("\nMatrices\n")
A = np.array([[1,2,3,4,5],
              [0,1,2,3,4],
              [2,3,4,5,6],
              [0,0,1,2,3],
              [0,0,0,0,1]])
print("A =", A)
print("\nA[0:2,3:5] =",A[0:2,3:5])
print("\nA[:2,3:] =", A[:2,3:])
print("\nA[[0,2,4],:] =",A[[0,2,4],:])
ind = np.array([0,2,4])
print("\nind =",ind)
print("\nA[ind,ind] =", A[ind,ind])
print("\nA[ind,ind[:,None]] =",A[ind,ind[:,None]])

# Número complejos
print("\nNumeros Complejos\n")
print(1j*1j)
print((1+2j)*1j)

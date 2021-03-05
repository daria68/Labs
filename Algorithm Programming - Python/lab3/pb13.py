def operez(I):
    if I==N-1-I:
        t=(I,I)
        L.append(t)
    else:
        for j in range(I,N-1-I):
            t=(I,j)
            L.append(t)
        for i in range(I,N-1-I):
            t=(i,N-I-1)
            L.append(t)
        for j in range(N-I-1,I,-1):
            t=(N-I-1,j)
            L.append(t)
        for i in range(N-I-1,I,-1):
            t=(i,I)
            L.append(t)
    return  L
N=int(input("N="))
A=[None]*N
L=[]
k=N//2+N%2
print(k)
for i in range(N):
    A[i]=[x+ i*N for x in range(1,N+1)]
print("a)Matricea:")

for list in A:
    print(list)
for i in range(k):
    operez(i)
print("b)Lista de tupluri:",'\n',L)

spirala=[]
for i in range(len(L)):
    spirala.append(A[L[i][0]][L[i][1]])
print("c)Parcurgerea in spirala:",'\n',spirala)




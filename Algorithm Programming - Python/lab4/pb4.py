def generator(subpunct):
    global n
    N=999999
    prim=[True for i in range(N)]
    prim[0]=False
    prim[1]=False
    p=2
    while p*p<=N:
        for i in range(2*p,N,p):
            prim[i]=False
        p+=1
    if subpunct=='a)':
        for i in range(2,n+1):
            if prim[i]==True:
                print(i,end=' ')
    else:
        i=0
        k=0
        while(k<n):
            if prim[i]==True:
                print(i,end=' ')
                k+=1
            i+=1

n=int(input('n='))
generator('a)')
print()
generator('b)')



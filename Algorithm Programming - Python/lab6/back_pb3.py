f=open('harti.in','r')
n=int(f.readline())
a=[[] for i in range(n)]
for x in a:
    for i in range(n):
        x.append(0)
for x in f.readlines():
    x=x.split()
    a[int(x[0])-1][int(x[1])-1]=1
    a[int(x[1]) - 1][int(x[0]) - 1] = 1
x=[0]*n
def cont(x,k):
    for i in range(k):
        if x[i]==x[k] and a[k][i]==1:
            return 0
    return 1
def back(k):
    if k==n:
        print(x)
    else:
        for i in range(1,5):
            x[k]=i
            if cont(x,k):
                back(k+1)
back(0)
f.close()







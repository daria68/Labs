f=open('descompunere.in','r')
g=open('descompunere.out','w')
n=int(f.readline())
x=[0]*n
def tipar(x,k):
    af=''
    for i in range(k):
        af+=str(x[i])+'+'
    af+=str(x[k])
    g.write(af)
    g.write('\n')
def back():
    k=0
    s=0
    while k>=0:
        if x[k]<n:
            x[k]+=1
            s+=1
            if s<=n: #conditie de continuare
                if s==n:
                    tipar(x,k)
                    s=s-x[k]
                    k-=1
                else:
                    #avansare
                    k+=1
                    x[k]=x[k-1]
                    s+=x[k]
            else:
                s=s-x[k]
                k-=1
back()
f.close()
g.close()
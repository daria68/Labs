f=open('generare.in','r')
g=open('generare.out','w')
s=int(f.readline())
x=[0]*s

def tipar(x,k):
    x[k+1]=0
    npoz=k+2
    poz=[0]*npoz
    def cont(poz, k):
        for i in range(k):
            if poz[i] == poz[k]:
                return 0
        return 1

    def tipar(poz):
        nrnou=0
        for i in range(npoz):
            nrnou=nrnou*10+x[poz[i]]
        g.write(str(nrnou))
        g.write('\n')
    def perm(k):
        if k == npoz:
            tipar(poz)
        else:
            for i in range(0, npoz, 1):
                poz[k] = i
                if cont(poz, k) == 1:
                    perm(k + 1)
    perm(0)
    print()
def back():
    k=0
    sum=0
    while k>=0:
        if x[k] <9:
            if x[k]<s:
                x[k]+=1
                sum+=1
                if sum<=s: #conditie de continuare
                    if sum==s:
                        tipar(x,k)
                        sum=sum-x[k]
                        k-=1
                    else:
                        #avansare
                        k+=1
                        x[k]=x[k-1]
                        sum+=x[k]
                else:
                    sum=sum-x[k]
                    k-=1
        else:
            sum = sum - x[k]
            k -= 1
back()
def afisare_timpi_servire(L):
    global timp_mediu
    timp_mediu=0
    k=0
    for i in range(len(L)):
        print(L[i][0]," ",L[i][1]," ",k)
        k += L[i][1]
        timp_mediu+=k

f=open("tis.txt",'r')
i=1
L=[]
for x in f.readline().split():
    L.append((i,int(x)))
    i+=1
afisare_timpi_servire(L)
print(round(timp_mediu/len(L),2))
L2=sorted(L,key=lambda t:t[1])
afisare_timpi_servire(L2)
print(round(timp_mediu/len(L),2))
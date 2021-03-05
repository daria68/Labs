f=open("spectacole.txt",'r')
L=[]
for x in f.readlines():
    x=x[0:-1].replace("-"," ")
    t= x.split(" ",2)
    L.append(tuple(t))
L2=sorted(L,key=lambda t:t[1])
print(L2[0])
for i in range(1,len(L2)):
     x=10*int(L2[i][0][0])+int(L2[i][0][1])
     y=10*int(L2[i-1][0][0])+int(L2[i-1][0][1])
     if x>y:
         print(L2[i])
     elif x==y:
         x = 10 * int(L2[i][0][3]) + int(L2[i][0][4])
         y = 10 * int(L2[i - 1][0][3]) + int(L2[i - 1][0][4])
         if x>y:
             print(L2[i])
f.close()

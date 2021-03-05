sir=input("sir=")
L1=[int(x) for x in sir.split()]
L2=[]
L2.extend(set(L1))
L2=sorted(L2,reverse=True)
print(L2)
max1,max2=L2[0],L2[1]
print(max1,max2)
L1=int(input("L1="))
L2=int(input("L2="))
arie=L1*L2
L1,L2=min(L1,L2),max(L1,L2)
while L1<L2:
    L2-=L1
    L1,L2=min(L1,L2),max(L1,L2)
print(" Numarul de placi necesare este:",arie//(L1*L1),"\n","Latura fiecarei placi este:",L1)

c1=str(input("cuv1="))
c2=str(input("cuv2="))
for i in range(len(c1)):
    k=c2.find(c1[i])
    if k==-1:
        print("sirurile nu sunt anagrame")
        break
    elif k>=0:
        c2=c2.replace(c1[i],"",1)
if c2=="":
    print("sirurile sunt anagrame")



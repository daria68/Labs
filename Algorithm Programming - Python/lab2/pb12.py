def tai(sir1,sir2):
    while sir1[len(sir1)-1]==sir2[0]:
        j=len(sir1)-1
        while sir1[j]==sir2[0]:
            sir2=sir2.replace(sir2[0],'',1)
        j=len(sir1)-1
        w=sir1[j]
        while sir1[j]==w and j>=0:
             sir1=sir1.replace(w,'',1)
             j-=1
    return sir1+sir2
sir=str(input("sir:"))
inv=''
for i in range(len(sir)-1,-1,-1):
    inv+=sir[i]
print(max(len(tai(sir,inv))),(len(tai(inv,sir))))
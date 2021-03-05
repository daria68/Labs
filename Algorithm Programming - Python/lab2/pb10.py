nume_complet=str(input(""))
k=0
for x in nume_complet.split():
    w=0
    for y in x.split('-'):
        w+=1
    if w>2:
        k=1
        break
    if len(x)<3:
        k=1
        break
    for i in range(len(x)):
        if x[i].isalpha()==False:
            if x.count('-')>1:
                k=1
                break
if nume_complet.title()!=nume_complet:
    k+=1
if k==0:
    print("Numele este corect")
else:
    print("Numele nu este corect")
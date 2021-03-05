D1={'Ana':2,'Daria':4,'Claudia':7,'Veronica':12,'Eusebiu':1,'Maria':3}
D2={'Eusebiu':7,'Sebastian':4,'Lucian':65,'Rares':1,'Irina':6,'Ana':12}
for x,y in D2.items():
    for v,w in D1.items():
        if v==x:
            D2[x]+=D1[v]
D1.update(D2)
print(D1)


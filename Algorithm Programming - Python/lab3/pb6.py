f=open('lorem_ipsum','r')
D={chr(k):0 for k in range(32,127)}
for x in f.readlines():
    for i in x:
        if i!='\n':
            D[i]+=1
for key,value in D.items():
    if value!=0:
        print(key,value)
import operator
text='ana are extrem de multe cuvinte daca si iar daca ana extrem o gramada de cuvinte pe care daca o sa care multe are  '
D={k: v for k in text.split() for v in range(text.count(k)+1)}
print(D)
D_sorted=sorted(D.items(),key=operator.itemgetter(1))
print(D_sorted)
L=[]
D2={}
i=1
for x in D_sorted:
    if x[1]==i:
        L.append(x[0])
    else:
        D2[i]=L
        i+=1
        while x[1]>i:
            i+=1
        L=[]
        L.append(x[0])
        D2[i] = L
print('Cuvantul care apare cel mai rar este:',sorted(D2[1])[0])
print('Cuvantul care apare cel mai des este:',sorted(D2[i])[0])





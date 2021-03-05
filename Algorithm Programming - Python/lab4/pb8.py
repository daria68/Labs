f=open('angajati.txt','r')
g=open('angajati_nume.txt','w')
L=[]
for x in f.readlines():
    if x[-1]=='\n':
        x=x[:-1].split(',')
    else:
        x = x.split(',')
    L.append(tuple(x))
def informatii(nume=input()):
    for x in L:
        if x[0]==nume:
            k=L.index(x)
            break
    print('varsta:',L[k][1],',','salariu:',L[k][2])
def salariu_maxim():
    M=max(L,key=lambda t: int(t[2]))[2]
    for x in L:
        if x[2]==M:
            print(x[0])
def salariu_mediu():
    s=0
    for x in L:
        s+=int(x[2])
    print(s/len(L))
def sort_alfabetic():
    g.write(str(sorted(L,key=lambda t:t[0])))
    g.write('\n')
def sort_descr_v_n():
    g.write(str(sorted(sorted(L,key=lambda t:t[1], reverse=True),key=lambda t:t[0])))
    g.write('\n')
informatii()
salariu_maxim()
salariu_mediu()
sort_alfabetic()
sort_descr_v_n()
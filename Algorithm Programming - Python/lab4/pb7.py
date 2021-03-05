f=open('cuvinte.txt','r')
g=open('cuv_sortate.txt','w')
L=[]
for x in f.readline().split():
    L.append(x)
def func(x):
    return len(x)
g.write('a)')
g.write(str(sorted(L,reverse=True)))
g.write('\n')
g.write('b)')
g.write(str (sorted(sorted(L),key=func)))
g.write('\n')
g.write('c)')
g.write(str(sorted(L,key=func)))
f.close()
g.close()

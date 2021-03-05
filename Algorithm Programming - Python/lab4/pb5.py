def negative_pozitive(*args):
    global n
    global p
    n=[]
    p=[]
    for x in args:
        if x<0:
            n.append(x)
        elif x>0:
            p.append(x)
args=[9,6,-4,3,2,-12,1,5,-14,0,7,-2]
negative_pozitive(*args)
f=open(input('nume_fisier='),'w')
p.sort()
n.sort()
f.write(str(n))
f.write('\n')
f.write(str(p))
f.close

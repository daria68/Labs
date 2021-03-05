f=open("test.in","r")
g=open("test.out","w")
for x in f:
    for i in range(len(x)):
        pozegal=x.index("=")
        if x[i]=='*':
           corect=int(x[:i])*int(x[i+1:pozegal])
           if corect==int(x[pozegal+1:]):
               g.write(" ".join((x[:len(x)-1],'Corect','\n')))
           else:
               g.write(" ".join((x[:len(x)-1],'Gresit',str(corect),'\n')))


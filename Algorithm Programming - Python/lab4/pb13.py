import re
def cautare_cuvant(cuv,nume_fis_out,*nume_fis_in):
    g=open(nume_fis_out,'w')
    for x in nume_fis_in:
        f=open(x,'r')
        k=0
        gasit=False
        for y in f.readlines():
            k+=1
            y=re.findall(r"[\w']+",y)
            if cuv in y:
                g.write(x+': '+str(k)+'\n')
                gasit=True
                break
        if gasit==False:
            g.write('Cuvintul dat nu exista in fisierul '+x+'\n')
        f.close()
    g.close()
cautare_cuvant('lac','rez.txt','eminescu.txt','bacovia.txt')


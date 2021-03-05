import re
def fisier_dict(nume_fisier):
    L=[]
    f=open(nume_fisier,'r')
    for x in f.readlines():
        x=re.findall(r"[\w']+",x)
        D={'plecare':x[0],'sosire':x[1],'ora_plecare':x[2]+':'+x[3],'ora_sosire':x[4]+':'+x[5]}
        L.append(D)
    return L
def timp_calatorie(ora_plecare,ora_sosire):
    if int(ora_plecare[3:])<=int(ora_sosire[3:]):
         ore=int(ora_sosire[:2])-int(ora_plecare[:2])
         minute=int(ora_sosire[3:])-int(ora_plecare[3:])
    else:
        ore=int(ora_sosire[:2])-1-int(ora_plecare[:2])
        minute=60-int(ora_plecare[3:])
        if ore>23 and minute>59:
            return None
    return ore,minute
def calatorie(lista_program)

L=(fisier_dict('program.txt'))
for x in L:
    print(timp_calatorie(x['ora_plecare'],x['ora_sosire']))



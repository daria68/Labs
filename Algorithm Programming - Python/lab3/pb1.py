from random import choices
from string import digits, ascii_lowercase, ascii_uppercase
f=open('date.in','r')
g=open('date.out','w')
email=[]
for x in f.readlines():
    x=x.split()
    email.append(x[1].lower()+'.'+x[0].lower()+'@myfmi.unibuc.ro,')
#generarea parolei temporare
for x in email:
    A=choices(ascii_uppercase) #litera mare
    a=choices(ascii_lowercase,k=3) #3 litere mici
    cif=choices(digits,k=4)
    parola="".join(A+a+cif)
    g.write(str(x)+parola+"\n")
f.close()
g.close()


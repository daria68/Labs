W="CURCUMA"
P=str(input("PROPOZITIE="))
s=str(input())
t=str(input())
poz=P.find(s)
while poz<len(P):
     if P[poz-1]==' ' and P[poz+len(s)==' ']:
          P=P.replace(s,t,1)
     poz=poz+len(s)+P[poz+len(s):].find(s)
print(P)

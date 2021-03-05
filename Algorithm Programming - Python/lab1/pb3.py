x=int(input("x="))
n=int(input("n="))
p=int(input("p="))
m=int(input("m="))
k=m/n
t=0
while k>0:
    t+=x*n
    x-=(p/100)*x
    k-=1
if m%n>0:
    t+=x*n
print(int(t))


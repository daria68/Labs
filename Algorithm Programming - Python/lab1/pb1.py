a=int(input("a="))
b=int(input("b="))
c=int(input("c="))
delta=b*b-4*a*c
if delta<0:
    print("Ecuatia nu are radacini reale")
elif delta>0:
    x1=  (-b -delta ** 0.5) // (2 * a)
    x2 = (-b +delta ** 0.5) // (2 * a)
    print("Ecuatia are doua radacini reale:",x1," ,",x2)
else:
    print("Ecuatia are o radacina reala dubla:",-b//(2*a))

from math import *
def lungime_arie_cerc(r):
    return 'Lungimea cercului este:',2*pi*r,'\n','Aria cercului este:',pi*(r**2)
print('a)',lungime_arie_cerc(3))
r=int(input("r="))
print('b)',lungime_arie_cerc(r))
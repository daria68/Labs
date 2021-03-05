text="ana merge la magazin"
k=2

#criptare
criptare=''
ap=[0]*len(text)

for i in range(len(text)):
   if text[i].isalpha()==True:
        w=ord(text[i])
        w+=k
        while w>122:
            w-=26
        criptare+=chr(w)
   else:
       criptare+=' '
print(criptare)

decriptare=''
for i in range(len(criptare)):
    if criptare[i].isalpha() == True:
        w = ord(criptare[i])
        w -= k
        while w <97:
            w += 26
        decriptare += chr(w)
    else:
        decriptare += ' '
print(decriptare)

s="A-na a-re mul-te me-re ro-sii si de-li-cioa-se."
new=""
for x in s.split():
    for i in range(0,len(x)):
        if x[i]=='-':
            new+='p'+x[i-1].lower()+'-'
        elif x[i]=='.':
            new+='p'+x[i-1]+'.'
        else:
            new+=x[i]
    if x[len(x)-1]!='.':
         new+='p'+x[len(x)-1]
         new+=' '
print(new)
print(new.replace('-',''))
s="Apa-napa apa-repe mulpl-tepe mepe-repe ropo-siipi sipi depe-lipi-cioapa-sepe."
new=s[0]
for i in range(1,len(s)-2):
    if  s[i].lower()==s[i+2] and s[i+1]=='p':
        new+=s[i]
    elif s[i]=='p':
        i+=1
    elif s[i-1]=='p':
        i+=1
    elif s[i]=='-':
        i+=1
    else:
        new+=s[i]
new+=s[len(s)-1]
print(new)
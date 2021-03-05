s="Apanapa aparepe meperepe"
vocale="aeiou"
new=""
for i in range(len(s)-2) :
    if vocale.find(s[i].lower())!=-1 and s[i+1]=='p' and vocale.find(s[i+2].lower())!=-1:
        new+=s[i]
    elif s[i]=='p':
        i+=1
    elif vocale.find(s[i].lower())!=-1 and s[i+1]!='p':
        i+=1
    else:
       new+=s[i]
print(new)
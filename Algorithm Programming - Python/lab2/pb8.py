text="Ana are mere"
vocale="aeiou"
new=""
for i in range(len(text)):
    if vocale.find(text[i].lower())!=-1:
        new+=text[i]+'p'+text[i].lower()
    else:
        new+=text[i]
print(new)
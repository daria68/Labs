text="Astăzi am cumpărat pâine de 5 RON, pe lapte am dat 10 RON, iar de 15 RON am cumpărat niște cașcaval. De asemenea, mi-am cumpărat și niște papuci cu 50 RON!”,"
sum=0
for x in text.split():
    if x.isnumeric():
        sum+=int(x)
print(sum)
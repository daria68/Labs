s='Salut, am văzut în acel anunț că vindeți o mașină second-hand. M-ar interesa s-o achiziționez pentru suma de $2700. Vă amintesc că suma din anunț este de $3000, sir. Desigur. Și totuși, n-am putea ajunge la mijloc? $2850? $2850 de dolari, spuneți? Mi se pare corect, s-a făcut.”'
k=0
new=''
for x in s.split():
    if x[0]=='$':
        k+=1
        x=x.replace('$','')
        if x[len(x)-1].isdigit()==False:
            x = x.replace(x[len(x)-1], '')
        new+=x
        new+=' '
        if k<=2:
            print(x)
new=new.split()
if new[len(new)-1]==new[len(new)-2]:
    print("S-au inteles la suma de $",new[len(new)-1])
else:
    print("Nu s-au inteles")


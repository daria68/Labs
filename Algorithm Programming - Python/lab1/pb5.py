n=int(input("n="))
v=[0]*n
for i in range(n):
    v[i]=int(input())
v.sort()
if v[n-1]==v[0]:
    print("Imposibil")
else:
    k = 2
    while v[n - 1] == v[n - k]:
        k += 1
    if k <= n:
         print(v[n - 1], v[n - k])







num = [1,2,3,2,1,2,4,32,2,1,2,2,3,4,2,1,12,3,32,2,2,1,2]
c=num[0]
d=dict()
for i in num:
    if i in d:
        d[i]+=1
    else:
        d[i]=1

e=max(d,key=d.get)
print('eng kop  qatnashga son ',e)
print(e,'soni',d[e],'marta qatnashgan')
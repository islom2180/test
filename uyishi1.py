# num = [1,2,3,2,1,2,4,32,2,1,2,2,3,4,2,1,12,3,32,2,2,1,2]
# c=num[0]
# d=dict()
# for i in num:
#     if i in d:
#         d[i]+=1
#     else:
#         d[i]=1

# e=max(d,key=d.get)
# print('eng kop  qatnashga son ',e)
# print(e,'soni',d[e],'marta qatnashgan')







def search_by_genre(cinema: list, genre: str) -> list:
    result = []

    for film in cinema:
        if film["genre"] == a:
            result.append(film)


    return result





cinema = [
    {"title": "Avatar", "genre": "Fantastika", "price": 40000},
    {"title": "Sherlock", "genre": "Detektiv", "price": 30000},
    {"title": "Oq yo‘l", "genre": "Drama", "price": 25000},
    {"title": "Dune", "genre": "Fantastika", "price": 35000}
]

a=input("janir kirit")
natija = search_by_genre(cinema,a)
if natija!=None:
    for i in natija:
        print(i)


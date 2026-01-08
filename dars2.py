# class nmadur:
#     def show(self):
#         print("salom")

# a=nmadur()
# a.show()       


# class animal:
#     def __init__(self, yosh, ism):
#         self.name = ism
#         self.old = yosh
#     def prnt(self):
#         print(f""" 
# Ism  : {self.name}
# Yosh : {self.old}   """)


# a=animal(12,'ali')
# a.prnt()



# class kop:
#     def __init__(self, brand, price, color, motor, year, maxspeed, oil):
#         self.nomi = brand
#         self.narx = price
#         self.rang = color
#         self.mator = motor
#         self.yill = year
#         self.tezli = maxspeed
#         self.benzin = oil


#     def info(self):
#         print(
# f"""
# brand       {self.nomi}
# price       {self.narx}
# color       {self.rang}
# motor       {self.mator}
# year        {self.yill}
# maxspeed    {self.tezli}
# oil         {self.benzin}
# """)


#     def change(self):
#         color=input("rangini kirit  ")
#         self.rang = color
#         print(
# f"""
# brand       {self.nomi}
# price       {self.narx}
# color       {self.rang}
# motor       {self.mator}
# year        {self.yill}
# maxspeed    {self.tezli}
# oil         {self.benzin}
# """)


#     def change_year(self):
#         year=input("yilini kirit")
#         self.yill=year
#         print(
# f"""
# brand       {self.nomi}
# price       {self.narx}
# color       {self.rang}
# motor       {self.mator}
# year        {self.yill}
# maxspeed    {self.tezli}
# oil         {self.benzin}
# """)


# a=kop('BMW',94000,'dark blue',5.6,2025,360,45)

# a.info()
# a.change()
# a.change_year()




# class talaba:
#     def __init__(self,name,f,score):
#         self.name = name
#         self.fam = f
#         self.score = score

#     def __str__(self):
#         return f"""
# ISM : {self.name}
# FAMILIYA : {self.fam}
# BALL : {self.score}
# """        
           
# s1 =talaba('ali','ganiyev',90)
# s2 =talaba('gani','aliyev',60)
# s3 =talaba('vali','turdiyev',52)
# s4 =talaba('saman','valiyev',32)

# lst = [s1,s2,s3,s4]

# print(min(lst,key=lambda x: x.score))



# class human:
#     def __init__(self,name,second,age):
#         self.name = name
#         self.second =second
#         self.age = age

#     def fullname(self):
#         return f"""
# F.I : {self.second} {self.name}
# """
    


# a=human('Islombek','Raxmatullayev',16)

# print(a.fullname())



class human:
    def __init__(self,name,age,ish,boyi,eni,oyligi):
        self.ism = name
        self.yosh = age
        self.ishi = ish
        self.boy = boyi
        self.en = eni
        self.oyli = oyligi

    def name(self):
        return self.ism
    def age(self):
        return self.yosh
    def ish(self):
        return self.ishi
    def boyi(self):
        return self.boy
    def eni(self):
        return self.en
    def oyligi(self):
        return self.oyli

a=human('ali',34,'bankir',1.80,70,13568000)
print(a.name())
print(a.age())
print(a.ish())
print(a.boyi())
print(a.eni())
print(a.oyligi())


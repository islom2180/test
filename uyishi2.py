class kitob:
    def __init__(self,name,mualif,narxi,nashriyoti):
        self.nomi = name
        self.mualif = mualif
        self.narx = narxi
        self.nashri = nashriyoti
        
    def name(self):
        if self.nomi[0] in 'abcdefgh':
            print(f"""
kitob nomi : {self.nomi}
kitob mualifi : {self.mualif}
kitob narxi : {self.narx} uzs
kitob nashri :{self.nashri} mahsuloti
""")






d1=kitob('qwerty','aleks gava',600000,'aqsh')
d2=kitob('wersachi','aleks gava',400000,'aqsh')
d3=kitob('zoo tupiya','aleks gava',350000,'aqsh')
d4=kitob('gari potr','aleks gava',240000,'aqsh')
d5=kitob('alana','aleks gava',100000,'aqsh')
d6=kitob('galaktika','aleks gava',340000,'aqsh')
d7=kitob('elekroman','aleks gava',180000,'aqsh')

d1.name()
d2.name()
d3.name()
d4.name()
d5.name()
d6.name()
d7.name()



class kompyuter:
    def __init__(self,name,rama,narxi,pratsesir):
        self.nomi = name
        self.ramasi = rama
        self.narx = narxi
        self.pratses = pratsesir



    def rama(self):
        if 16>=self.ramasi>=4:
            print(f"""
nomi : {self.nomi}
rama : {self.ramasi}
narxi : {self.narx}
pratsesori : {self.pratses}
""")


m1=kompyuter('asus',4,360,56)
m2=kompyuter('mac',12,900,58)
m3=kompyuter('dell',4,350,32)
m4=kompyuter('lenovo',3,200,32)
m5=kompyuter('thinkpad',8,670,56)

m1.rama()
m2.rama()
m3.rama()
m4.rama()
m5.rama()


class user:
    def __init__(self,foydalanuvchi,ismi,familiya,email):

        self.foyda = foydalanuvchi
        self.ism = ismi
        self.famil = familiya
        self.em = email


    def prt(self):
        print(f"""
foydalanuvchi : {self.foyda}
ismi : {self.ism} {self.famil}
email : {self.em}
""")

a=input("akaunt nomini kirit  ")
i=input("ismingni kirit  ")
f=input('familyangni kirit  ')
e=input('emailingni kirit  ')

s=user(a,i,f,e)

s.prt()





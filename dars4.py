class moshina:
    def __init__(self,engine, bak, benzinmiqdori, probeg ,km):
        self.mator = engine
        self.bak = bak
        self.miq = benzinmiqdori
        self.probeg = probeg
        self.km=km
    def yur(self):
        if self.mator == True:
            self.benzin 


    def benzin(self):

        if self.miq <= self.km:
            print('manzilga yetish uchun',self.km-self.miq,"litr quyish kere")

            print('bakni toldirish uchun',self.bak - self.miq)

        elif self.miq>self.km:
            print('benziningiz yetarli')
            print('bakni toldirish uchun',self.bak - self.miq)

        while self.km > 0 and self.miq > 0:
            self.km -= 1
            self.miq -= 1
            print(f"Qoldi: {self.km} km | Benzin: {self.miq} litr")
        if self.km == 0 :
            print('manzilga yetib keldik')
        else:
            print(f"{self.km} km qolganda baenzin tugadi ")






a=input("on or off   ")
if a == 'on':
    d=int(input("naecha km yol yuras >>>"))

    taksi=moshina(a,40,7,200,d)
    taksi.yur()
    taksi.benzin()
    
else:
    print("moshina zavad bomagan")




class drug:
    def __init__(self,name,date):
        self.name = name
        self.date = date

    def get_time(self):
    

        print(f'''
dori nomi: {self.name}
chiqan sanasi: {self.date}
''')



d1 = drug('analgin','23.3.2025')
d1.get_time()


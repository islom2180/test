# class employe:
#     def __init__(self, name: str, employee_id: str, hourly_rate: float = 15.0):
#         self.name = name
#         self.employ = employee_id
#         self.hour = hourly_rate
#         self.work = []

#     def time(self,hour: int):
#         if 0<=hour<=24:
#             self.work.append(hour)
#             return True
#         return False
    
#     def total(self):    
#         return sum(self.work)
    

#     def calculatr(self):
#         return sum(self.work) * self.hour
    

#     def rest(self):
#         self.work.clear()

# worker = employe('sasha','01d20',25.15)
# soatlar = [2,10,4,12]
# for soat in soatlar:

#     print(worker.time(soat))
# print("jami ishlagan soati",worker.total(),'soat')
# print('jami maoshi',worker.calculatr())
# worker.rest()

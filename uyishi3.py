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





# from typing import List, Tuple, Optional

# class Playlist:
#     def __init__(self, owner: str) -> None:
#         self.owner: str = owner
#         self.tracks: List[Tuple[str, str]] = []

#     def add_track(self, title: str, artist: str) -> None:
#         """Qo‘shiqni ro‘yxat oxiriga qo‘shadi (takroriy bo‘lsa ham)"""
#         self.tracks.append((title, artist))

#     def remove_last(self) -> Optional[Tuple[str, str]]:
#         """Oxirgi qo‘shiqni olib tashlaydi va qaytaradi. Agar bo‘sh bo‘lsa None"""
#         if self.tracks:
#             return self.tracks.pop()
#         return None

#     def total_tracks(self) -> int:
#         """Jami qo‘shiqlar soni"""
#         return len(self.tracks)

#     def unique_tracks(self) -> List[Tuple[str, str]]:
#         """Noyob qo‘shiqlar ro‘yxati"""
#         seen = set()
#         unique = []
#         for track in self.tracks:
#             if track not in seen:
#                 unique.append(track)
#                 seen.add(track)
#         return unique

#     def search_by_title(self, title: str) -> List[Tuple[str, str]]:
#         """Berilgan title bo‘yicha qo‘shiqlar ro‘yxati"""
#         return [track for track in self.tracks if track[0] == title]

#     def filter_by_artist(self, artist: str) -> List[Tuple[str, str]]:
#         """Berilgan artist bo‘yicha qo‘shiqlar ro‘yxati"""
#         return [track for track in self.tracks if track[1] == artist]



# if __name__ == "__main__":
#     pl = Playlist("Muhammad")

#     print(pl.total_tracks())  # 0

#     pl.add_track("Yomg'irlar", "Shahzoda")
#     pl.add_track("Gulim", "Yulduz Usmonova")
#     pl.add_track("Yomg'irlar", "Shahzoda")
#     pl.add_track("Xayr edi", "Lola")
#     pl.add_track("Kel", "Ulug'bek Rahmatullayev")

#     print(pl.total_tracks())  # 5
#     print(pl.unique_tracks()) 
    
#     print(pl.remove_last())  
    
#     print(pl.total_tracks())  # 4
#     print(pl.search_by_title("Yomg'irlar"))  
    
#     print(pl.filter_by_artist("Yulduz Usmonova"))  





from typing import List

class Student:
    def __init__(self, name: str, student_id: str) -> None:
        self.name: str = name
        self.student_id: str = student_id
        self.__grades: List[int] = []  
        print(f"Yangi talaba yaratildi: {self.name}, ID: {self.student_id}, boshlang'ich baholar ro'yxati bo'sh.")

    def add_grade(self, grade: int) -> None:
        """Baho qo'shadi, faqat 0-100 oralig'ida"""
        if 0 <= grade <= 100:
            self.__grades.append(grade)
            print(f"{grade} bahosi qo'shildi.")
        else:
            print("Xato: Noto'g'ri baho")

    def calculate_average(self) -> float:
        """Baholar o'rtachasini hisoblaydi"""
        if not self.__grades:
            return 0.0
        return sum(self.__grades) / len(self.__grades)

    def get_status(self) -> str:
        """O'rtacha bahoga qarab statusni qaytaradi"""
        avg = self.calculate_average()
        if 90 <= avg <= 100:
            return "A'lo"
        elif 80 <= avg < 90:
            return "Yaxshi"
        elif 70 <= avg < 80:
            return "Qoniqarli"
        else:
            return "Qoniqarsiz"


if __name__ == "__main__":
    student = Student("Nodira", "S123")
    
    student.add_grade(85)  
    student.add_grade(90) 
    student.add_grade(150) 

    print(student.calculate_average())  
    print(student.get_status())        

import pymysql

class MySQL:
    def __init__(self):
        self.ConnectDB()
        self.CreateDB()
        self.CreateTeacherTB()
        self.CreateStudentTB()

    def ConnectDB(self):
        self.db = pymysql.connect(
            host="localhost",
            user = 'root',
            password="yusuf6451895"
        )
        self.c = self.db.cursor()

    def CreateDB(self):
        self.c.execute("CREATE DATABASE IF NOT EXISTS school;")
        self.c.execute("USE school")

    def CreateTeacherTB(self):
        self.c.execute("""CREATE TABLE IF NOT EXISTS teachers(
                                name VARCHAR(50),
                                surname VARCHAR(50),
                                salary INT,
                                experience INT,
                                branch VARCHAR(50)        
                                 )""")
    
    def InsertTeacher(self, name, surname, salary, exper, branch):
        self.c.execute(f"""INSERT INTO teachers VALUES(
                            "{name}",
                            "{surname}",
                            {salary},
                            {exper},
                            "{branch}"
                       )""")
        self.db.commit()

    def CreateStudentTB(self):
        self.c.execute("""CREATE TABLE IF NOT EXISTS students(
                                name VARCHAR(50),
                                surname VARCHAR(50),
                                monthly_payment INT,
                                course_duration INT,
                                branch VARCHAR(50)        
                                 )""")
        
    def InsertStudent(self, name, surname, month, course, branch):
        self.c.execute(f"""INSERT INTO students VALUES(
                            "{name}",
                            "{surname}",
                            {month},
                            {course},
                            "{branch}"
                       )""")
        self.db.commit()

    def First(self):
        pass

    def Second(self):
        pass

    def Third(self, new_salary):
        pass

    def Fourth(self):
        pass

    def Fifth(self):
        pass

    def Sixth(self):
        pass

    def Seventh(self):
        pass

    def Eighth(self):
        pass

    def Nineth(self):
        pass

    def Tenth(self):
        pass

    def Eleventh(self):
        pass
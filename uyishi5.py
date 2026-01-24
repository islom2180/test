import pymysql


class MySQL:

    def __init__(self):
        self.ConnectDB()
        self.CreateDB()
        self.CreateCompanyTB()


    def ConnectDB(self):
        self.db = pymysql.connect(
            host="localhost",
            user='root',
            password="1234"
        )
        self.c = self.db.cursor()


    def CreateDB(self):
        self.c.execute("CREATE DATABASE IF NOT EXISTS company_db;")
        self.c.execute("USE company_db")



    def CreateCompanyTB(self):
        self.c.execute("""CREATE TABLE IF NOT EXISTS Company(
                                id INT AUTO_INCREMENT PRIMARY KEY,
                                name VARCHAR(100),
                                location VARCHAR(100),
                                capital BIGINT,
                                employees_count INT,
                                establishedAt DATE,
                                monthly_expenses INT
                                 )""")




    def InsertCompany(self, name, location, capital, employees_count, establishedAt, monthly_expenses):
        self.c.execute(f"""INSERT INTO Company
                           (name, location, capital, employees_count, establishedAt, monthly_expenses)
                           VALUES ("{name}", "{location}", {capital}, {employees_count}, "{establishedAt}", {monthly_expenses})
                        """)
        self.db.commit()



    def sort_company(self):
        self.c.execute('''
select * from company_db order by name;
''') 
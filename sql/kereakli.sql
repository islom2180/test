--1 
SELECT * FROM computer ORDER BY price DESC LIMIT 1;

--2
SELECT frequency FROM computer WHERE price BETWEEN 400 AND 1000 AND cpu LIKE "%intel%";

SELECT * FROM computer WHERE price = (SELECT MAX(price) FROM computer );
+-------+------+----------+-----------+------+---------+-------+
| brand | name | cpu      | frequency | ram  | os      | price |
+-------+------+----------+-----------+------+---------+-------+
| HP    | Omen | Intel i7 |         5 |   16 | Windows |  1850 |
+-------+------+----------+-----------+------+---------+-------+

------------------------------DELETE----------------------

DELETE FROM book WHERE name IN ("5", "3");
DELETE FROM book WHERE LENGTH(name) > 8;
DELETE FROM book ORDER BY price LIMIT 1;

------------------------------UPDATE-----------------------

UPDATE book SET name = "HP" WHERE brand = "apple";
UPDATE book SET os="Linux", price=500 WHERE brand = "HP";
UPDATE book SET frequency=5 WHERE name LIKE '%z%' ORDER BY frequency LIMIT 1;

----------------------------Qo'shimcha kuchlar -------------------------

CREATE TABLE test(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course INT DEFAULT 1,
    email VARCHAR(50) UNIQUE
);

INSERT INTO test VALUES(1, "Karim", 2, "Ka@gmail.com");
INSERT INTO test(name, course, email) VALUES("oLIM", 4, "Ka@gmail.com") -- ERROR


----------------------------ALTER TABLE ---------------------------------

ADD     -- yangi ustun qo'shadi
DROP    -- ustun o'chiradi 
MODIFY  -- column'ni type'ni o'zgartiradi
CHANGE COLUMN  -- column'ni nomi va type'ni o'zgartiradi 
RENAME TO   -- table nomi'ni o'zgartiradi

ALTER TABLE book ADD joja INT;
ALTER TABLE book ADD id INT AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE book ADD karam VARCHAR(50) AFTER cpu;

ALTER TABLE book DROP joja;

ALTER TABLE book MODIFY karam INT;
ALTER TABLE book MODIFY karam SMALLINT FIRST;

ALTER TABLE book CHANGE COLUMN karam kapusta INT;

ALTER TABLE book RENAME TO kitob;

ALTER TABLE kitob
    ADD KALXOZ INT AFTER id,
    DROP kapusta,
    CHANGE COLUMN brand brend VARCHAR(100),
    MODIFY ram SMALLINT AFTER price,
    RENAME TO book;


------------------------------- GROUP BY ------------------------------

SELECT brend, JSON_ARRAYAGG(name) FROM book GROUP BY brend;
+-----------+------------------------------------+
| brend     | JSON_ARRAYAGG(name)                |
+-----------+------------------------------------+
| Acer      | ["Aspire 5"]                       |
| Aplle     | ["HP"]                             |
| ASUS      | ["ZenBook", "VivoBook", "ZenBook"] |
| ASUS TUF  | ["Gaming"]                         |
| Dell      | ["Inspiron", "Latitude", "G15"]    |
| HP        | ["Pavilon", "Omen"]                |
| Lenovo    | ["ThinkPad", "Legion 5"]           |
| MacBook   | ["Air M1"]                         |
| MSI GF 63 | ["MSI GF63"]                       |
+-----------+------------------------------------+


SELECT brend, JSON_ARRAYAGG(name), COUNT(*) FROM book GROUP BY brend;
+-----------+------------------------------------+----------+
| brend     | JSON_ARRAYAGG(name)                | COUNT(*) |
+-----------+------------------------------------+----------+
| Acer      | ["Aspire 5"]                       |        1 |
| Aplle     | ["HP"]                             |        1 |
| ASUS      | ["ZenBook", "VivoBook", "ZenBook"] |        3 |
| ASUS TUF  | ["Gaming"]                         |        1 |
| Dell      | ["Inspiron", "Latitude", "G15"]    |        3 |
| HP        | ["Pavilon", "Omen"]                |        2 |
| Lenovo    | ["ThinkPad", "Legion 5"]           |        2 |
| MacBook   | ["Air M1"]                         |        1 |
| MSI GF 63 | ["MSI GF63"]                       |        1 |
+-----------+------------------------------------+----------+


SELECT os, JSON_ARRAYAGG(name), SUM(price) FROM book GROUP BY os;
+---------+-----------------------------------------------------------------------------------------------------------------------------+------------+
| os      | JSON_ARRAYAGG(name)                                                                                                         | SUM(price) |
+---------+-----------------------------------------------------------------------------------------------------------------------------+------------+
| Linux   | ["Pavilon", "Omen"]                                                                                                         |       1000 |
| macOS   | ["HP", "Air M1"]                                                                                                            |       1800 |
| Windows | ["ZenBook", "Inspiron", "Aspire 5", "VivoBook", "Latitude", "ThinkPad", "Gaming", "MSI GF63", "Legion 5", "ZenBook", "G15"] |      10850 |
+---------+-----------------------------------------------------------------------------------------------------------------------------+------------+



SELECT os, JSON_ARRAYAGG(name), SUM(price) AS summa FROM book GROUP BY os HAVING summa > 1000;
+---------+-----------------------------------------------------------------------------------------------------------------------------+-------+
| os      | JSON_ARRAYAGG(name)                                                                                                         | summa |
+---------+-----------------------------------------------------------------------------------------------------------------------------+-------+
| macOS   | ["HP", "Air M1"]                                                                                                            |  1800 |
| Windows | ["ZenBook", "Inspiron", "Aspire 5", "VivoBook", "Latitude", "ThinkPad", "Gaming", "MSI GF63", "Legion 5", "ZenBook", "G15"] | 10850 |
+---------+-----------------------------------------------------------------------------------------------------------------------------+-------+


SELECT brend, JSON_ARRAYAGG(name), JSON_ARRAYAGG(os) FROM book GROUP BY brend HAVING COUNT(brend) > 1;
+--------+------------------------------------+-----------------------------------+
| brend  | JSON_ARRAYAGG(name)                | JSON_ARRAYAGG(os)                 |
+--------+------------------------------------+-----------------------------------+
| ASUS   | ["ZenBook", "VivoBook", "ZenBook"] | ["Windows", "Windows", "Windows"] |
| Dell   | ["Inspiron", "Latitude", "G15"]    | ["Windows", "Windows", "Windows"] |
| HP     | ["Pavilon", "Omen"]                | ["Linux", "Linux"]                |
| Lenovo | ["ThinkPad", "Legion 5"]           | ["Windows", "Windows"]            |
+--------+------------------------------------+-----------------------------------+








show databases; -- Mavjud database lar ni olib chiqadi

CREATE DATABASE found182; -- Ko'rsatilgan nomli database yaratadi

CREATE DATABASE IF NOT EXISTS found182; --Ko'rsatilgan database  ni mavjud bo'lmasagina yaratadi agar mavjud bo'lsa shunchaki hatolik bermaydi, yaratmaydi ham

USE found182; -- Ko'rsatilgan database ichiga kiradi

SELECT 2+2;
+-----+
| 2+2 |
+-----+
|   4 |
+-----+

SELECT now();
+---------------------+
| now()               |
+---------------------+
| 2026-01-13 18:08:48 |
+---------------------+

SELECT CONCAT("Karim", " ", "Fozilov");
+---------------------------------+
| CONCAT("Karim", " ", "Fozilov") |
+---------------------------------+
| Karim Fozilov                   |
+---------------------------------+

SELECT CONCAT("Karim", " ", "Fozilov") AS full_name;
+---------------+
| full_name     |
+---------------+
| Karim Fozilov |
+---------------+

SELECT  CONCAT("Karimov", " ", "Fozilov") AS full_name, CONCAT("Toshmatov", " ", "Ergash");

---------------------------------------------------------------------

SHOW TABLES; -- Database ichidagi mavjud table'larni qaytaradi

CREATE TABLE students(id INT, name VARCHAR(50), second TEXT, age SMALLINT, salary REAL, birth_date DATE); 

INSERT INTO students VALUES(1, "Alisher", "Kasimov", 23, 145.2, "2002-12-12");
INSERT INTO students(name, second, salary, birth_date) VALUES("kARIMA", "Abduvoxidova", 47.3, "2005-10-17");
INSERT INTO students VALUES
        (3, "oDINA", "Karimova", 12, 3.5, "2014-01-01"), 
        (4, "Jaxongir", "Asasdov", 47, 2.0, "2015-12-08"),
        (5, "Mirjalol", "Turobov", 23, 5000, "2003-05-20");

-------------------------------------------------------------------------
SELECT * FROM students;

SELECT name, second FROM students;
+----------+--------------+
| name     | second       |
+----------+--------------+
| Alisher  | Kasimov      |
| kARIMA   | Abduvoxidova |
| oDINA    | Karimova     |
| Jaxongir | Asasdov      |
| Mirjalol | Turobov      |
+----------+--------------+

SELECT name, age, YEAR(birth_date) FROM students;
+----------+------+------------------+
| name     | age  | YEAR(birth_date) |
+----------+------+------------------+
| Alisher  |   23 |             2002 |
| kARIMA   | NULL |             2005 |
| oDINA    |   12 |             2014 |
| Jaxongir |   47 |             2015 |
| Mirjalol |   23 |             2003 |
+----------+------+------------------+

----------------------------------------filtirlash------------------------

SELECT *  FROM students WHERE age > 20;
+------+----------+---------+------+--------+------------+
| id   | name     | second  | age  | salary | birth_date |
+------+----------+---------+------+--------+------------+
|    1 | Alisher  | Kasimov |   23 |  145.2 | 2002-12-12 |
|    4 | Jaxongir | Asasdov |   47 |      2 | 2015-12-08 |
|    5 | Mirjalol | Turobov |   23 |   5000 | 2003-05-20 |
+------+----------+---------+------+--------+------------+

SELECT * FROM students WHERE age>20 AND salary < 100;
+------+----------+---------+------+--------+------------+
| id   | name     | second  | age  | salary | birth_date |
+------+----------+---------+------+--------+------------+
|    4 | Jaxongir | Asasdov |   47 |      2 | 2015-12-08 |
+------+----------+---------+------+--------+------------+

SELECT * FROM students WHERE age=23 OR age=47;
+------+----------+---------+------+--------+------------+
| id   | name     | second  | age  | salary | birth_date |
+------+----------+---------+------+--------+------------+
|    1 | Alisher  | Kasimov |   23 |  145.2 | 2002-12-12 |
|    4 | Jaxongir | Asasdov |   47 |      2 | 2015-12-08 |
|    5 | Mirjalol | Turobov |   23 |   5000 | 2003-05-20 |
+------+----------+---------+------+--------+------------+

SELECT * FROM students WHERE id IS NULL;
+------+--------+--------------+------+--------+------------+
| id   | name   | second       | age  | salary | birth_date |
+------+--------+--------------+------+--------+------------+
| NULL | kARIMA | Abduvoxidova | NULL |   47.3 | 2005-10-17 |
+------+--------+--------------+------+--------+------------+

SELECT * FROM students WHERE age IN (23, 47);
+------+----------+---------+------+--------+------------+
| id   | name     | second  | age  | salary | birth_date |
+------+----------+---------+------+--------+------------+
|    1 | Alisher  | Kasimov |   23 |  145.2 | 2002-12-12 |
|    4 | Jaxongir | Asasdov |   47 |      2 | 2015-12-08 |
|    5 | Mirjalol | Turobov |   23 |   5000 | 2003-05-20 |
+------+----------+---------+------+--------+------------+

SELECT * FROM students WHERE age BETWEEN 23 AND 47;
+------+----------+----------+------+--------+------------+
| id   | name     | second   | age  | salary | birth_date |
+------+----------+----------+------+--------+------------+
|    1 | Alisher  | Kasimov  |   23 |  145.2 | 2002-12-12 |
|    4 | Jaxongir | Asasdov  |   47 |      2 | 2015-12-08 |
|    5 | Mirjalol | Turobov  |   23 |   5000 | 2003-05-20 |
|    8 | Abdulla  | Jorayev  |   28 |   47.3 | 2023-08-14 |
+------+----------+----------+------+--------+------------+

SELECT * FROM students WHERE MONTH(birth_date) IN (6,7,8);
+------+---------+----------+------+--------+------------+
| id   | name    | second   | age  | salary | birth_date |
+------+---------+----------+------+--------+------------+
|    8 | Abdulla | Jorayev |   28 |   47.3 | 2023-08-14  |
+------+---------+----------+------+--------+------------+

SELECT name, age FROM students WHERE name LIKE "%A%";
+----------+------+
| name     | age  |
+----------+------+
| Alisher  |   23 |
| kARIMA   | NULL |
| oDINA    |   12 |
| Jaxongir |   47 |
| Mirjalol |   23 |
| Abdulla  |   28 |
+----------+------+

--------------------------------------------sortlash-------------------------

select * from students order by ism;
+------+--------+--------+------------+--------+------+
| id   | ism    | course | birth      | scolar | tuz  |
+------+--------+--------+------------+--------+------+
|    2 | Ali    |      4 | 2023-02-11 |   47.3 | NULL |
|    5 | Ali    |      1 | 2000-02-11 |   17.3 | NULL |
|    1 | Aziza  |      2 | 2025-02-20 |   45.6 | NULL |
|    3 | Aziza  |      1 | 2020-01-11 |   14.5 | NULL |
|    7 | Karima |      4 | 2000-11-15 |     14 | NULL |
|    6 | Laziza |      1 | 1995-11-11 |   14.5 | NULL |
+------+--------+--------+------------+--------+------+


select * from students order by ism, course;
+------+--------+--------+------------+--------+------+
| id   | ism    | course | birth      | scolar | tuz  |
+------+--------+--------+------------+--------+------+
|    5 | Ali    |      1 | 2000-02-11 |   17.3 | NULL |
|    2 | Ali    |      4 | 2023-02-11 |   47.3 | NULL |
|    3 | Aziza  |      1 | 2020-01-11 |   14.5 | NULL |
|    1 | Aziza  |      2 | 2025-02-20 |   45.6 | NULL |
|    7 | Karima |      4 | 2000-11-15 |     14 | NULL |
|    6 | Laziza |      1 | 1995-11-11 |   14.5 | NULL |
+------+--------+--------+------------+--------+------+

SELECT  * FROM students ORDER BY scolar DESC;
+------+--------+--------+------------+--------+------+
| id   | ism    | course | birth      | scolar | tuz  |
+------+--------+--------+------------+--------+------+
|    2 | Ali    |      4 | 2023-02-11 |   47.3 | NULL |
|    1 | Aziza  |      2 | 2025-02-20 |   45.6 | NULL |
|    5 | Ali    |      1 | 2000-02-11 |   17.3 | NULL |
|    3 | Aziza  |      1 | 2020-01-11 |   14.5 | NULL |
|    6 | Laziza |      1 | 1995-11-11 |   14.5 | NULL |
|    7 | Karima |      4 | 2000-11-15 |     14 | NULL |
+------+--------+--------+------------+--------+------+

SELECT * FROM students WHERE ism LIKE "%z%" ORDER BY course;
+------+--------+--------+------------+--------+------+
| id   | ism    | course | birth      | scolar | tuz  |
+------+--------+--------+------------+--------+------+
|    3 | Aziza  |      1 | 2020-01-11 |   14.5 | NULL |
|    6 | Laziza |      1 | 1995-11-11 |   14.5 | NULL |
|    1 | Aziza  |      2 | 2025-02-20 |   45.6 | NULL |
+------+--------+--------+------------+--------+------+
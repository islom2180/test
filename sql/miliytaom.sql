

CREATE DATABASE computer;


CREATE TABLE malumot(    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand VARCHAR(50),
    model VARCHAR(50),
    cpu VARCHAR(50),
    frequency DECIMAL(3,1),
    ram INTEGER,
    os VARCHAR(50),
    price INTEGER
);


INSERT INTO malumot (brand,model,cpu,frequency,ram,os,price)VALUES
('Apple', 'MacBook Pro 13', 'Intel Core i7', 3.1, 16, 'macOS', 2500),
('Apple', 'MacBook Air M1', 'Intel Core i5', 2.8, 8, 'macOS', 1800),
('Apple', 'MacBook Pro 16', 'Intel Core i9', 3.9, 16, 'macOS', 3000),
('Apple', 'MacBook Air 2019', 'Intel Core i5', 2.5, 8, 'macOS', 1400),

('ASUS', 'ZenBook 14', 'Intel Core i7', 3.5, 16, 'Windows 11', 1600),
('ASUS', 'VivoBook S15', 'Intel Core i5', 2.4, 8, 'Windows 10', 900),
('ASUS', 'ROG Strix', 'AMD Ryzen 7', 3.8, 16, 'Windows 11', 2200),
('ASUS', 'TUF Gaming', 'AMD Ryzen 5', 3.6, 16, 'Windows 10', 1300),

('Dell', 'XPS 13', 'Intel Core i7', 3.2, 16, 'Windows 11', 2000),
('Dell', 'Inspiron 15', 'Intel Core i5', 2.3, 8, 'Windows 10', 850),
('Dell', 'G15', 'AMD Ryzen 5', 3.5, 16, 'Windows 11', 1400),
('Dell', 'Latitude 5420', 'Intel Core i7', 3.0, 16, 'Ubuntu 20.04', 1700),

('HP', 'Spectre x360', 'Intel Core i7', 3.6, 16, 'Windows 11', 2100),
('HP', 'Pavilion 14', 'Intel Core i5', 2.1, 8, 'Windows 10', 750),
('HP', 'Omen 16', 'AMD Ryzen 7', 3.9, 16, 'Windows 11', 2300),
('HP', 'EliteBook 840', 'Intel Core i5', 2.6, 16, 'Ubuntu 20.04', 1600),

('Lenovo', 'ThinkPad X1', 'Intel Core i7', 3.4, 16, 'Windows 11', 1900),
('Lenovo', 'IdeaPad 3', 'AMD Ryzen 5', 2.8, 8, 'Windows 10', 650),
('Lenovo', 'Legion 5', 'AMD Ryzen 7', 3.7, 16, 'Windows 11', 1800),
('Lenovo', 'ThinkBook 15', 'Intel Core i5', 2.5, 8, 'Windows 10', 950);




SELECT * FROM malumot;




-- birinchi shart 



SELECT brand, model, cpu, price FROM malumot WHERE price = (SELECT MAX(price) FROM malumot);

+-------+----------------+---------------+-------+
| brand | model          | cpu           | price |
+-------+----------------+---------------+-------+
| Apple | MacBook Pro 16 | Intel Core i9 |  3000 |
| Apple | MacBook Pro 16 | Intel Core i9 |  3000 |
+-------+----------------+---------------+-------+


-- ikinchi shart



 SELECT brand, model, cpu, price FROM malumot WHERE price = (SELECT min(price) FROM malumot);
+--------+-----------+-------------+-------+
| brand  | model     | cpu         | price |
+--------+-----------+-------------+-------+
| Lenovo | IdeaPad 3 | AMD Ryzen 5 |   650 |
| Lenovo | IdeaPad 3 | AMD Ryzen 5 |   650 |
+--------+-----------+-------------+-------+




--uchinchi shart 



SELECT frequency FROM malumot WHERE price BETWEEN 400 AND 1000 AND cpu LIKE '%Intel%' ;
+-----------+
| frequency |
+-----------+
|       2.4 |
|       2.3 |
|       2.1 |
|       2.5 |
|       2.4 |
|       2.3 |
|       2.1 |
|       2.5 |
+-----------+



-- tortinchi  shart 

SELECT count(*) as aple_soni  FROM malumot WHERE brand LIKE "%Apple%";


+-----------+
| aple_soni |
+-----------+
|         8 |
+-----------+



-- beshinchi shart 



select price from malumot WHERE os LIKE "%Windows%" and ram > 8  order by price;


+-------+
| price |
+-------+
|  1300 |
|  1300 |
|  1400 |
|  1400 |
|  1600 |
|  1600 |
|  1800 |
|  1800 |
|  1900 |
|  1900 |
|  2000 |
|  2000 |
|  2100 |
|  2100 |
|  2200 |
|  2200 |
|  2300 |
|  2300 |
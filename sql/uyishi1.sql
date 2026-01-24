
    MYSQL GROUP BY UYGA VAZIFA (JOIN ISHTIROK ETMAYDI)

    --Jadval: sales
    --Ustunlar:
    --id, product_name, category, price, quantity, sale_date

    --------------------------------------------------
    --JADVAL YARATISH
    --------------------------------------------------
    CREATE database dokon;


    CREATE TABLE sales (
        id INT PRIMARY KEY,
        product_name VARCHAR(50),
        category VARCHAR(50),
        price INT,
        quantity INT,
        sale_date DATE
    );

    --------------------------------------------------
    --MA’LUMOTLAR (20 ta INSERT)
    --------------------------------------------------
    INSERT INTO sales VALUES (1, 'Laptop', 'Electronics', 800, 2, '2025-01-01');
    INSERT INTO sales VALUES (2, 'Phone', 'Electronics', 600, 3, '2025-01-01');
    INSERT INTO sales VALUES (3, 'TV', 'Electronics', 900, 1, '2025-01-02');
    INSERT INTO sales VALUES (4, 'Headphones', 'Electronics', 150, 5, '2025-01-03');

    INSERT INTO sales VALUES (5, 'Table', 'Furniture', 300, 1, '2025-01-01');
    INSERT INTO sales VALUES (6, 'Chair', 'Furniture', 100, 4, '2025-01-02');
    INSERT INTO sales VALUES (7, 'Sofa', 'Furniture', 1200, 1, '2025-01-03');
    INSERT INTO sales VALUES (8, 'Bed', 'Furniture', 900, 1, '2025-01-04');

    INSERT INTO sales VALUES (9, 'T-shirt', 'Clothing', 40, 6, '2025-01-01');
    INSERT INTO sales VALUES (10, 'Jeans', 'Clothing', 70, 3, '2025-01-02');
    INSERT INTO sales VALUES (11, 'Jacket', 'Clothing', 120, 2, '2025-01-03');
    INSERT INTO sales VALUES (12, 'Shoes', 'Clothing', 90, 4, '2025-01-04');

    INSERT INTO sales VALUES (13, 'Apple', 'Food', 2, 20, '2025-01-01');
    INSERT INTO sales VALUES (14, 'Bread', 'Food', 3, 15, '2025-01-02');
    INSERT INTO sales VALUES (15, 'Milk', 'Food', 4, 10, '2025-01-03');
    INSERT INTO sales VALUES (16, 'Cheese', 'Food', 8, 5, '2025-01-04');

    INSERT INTO sales VALUES (17, 'Notebook', 'Stationery', 5, 10, '2025-01-01');
    INSERT INTO sales VALUES (18, 'Pen', 'Stationery', 2, 25, '2025-01-02');
    INSERT INTO sales VALUES (19, 'Marker', 'Stationery', 4, 12, '2025-01-03');
    INSERT INTO sales VALUES (20, 'Folder', 'Stationery', 6, 8, '2025-01-04');

    --------------------------------------------------
    MASALALAR (TOP 10)
    --------------------------------------------------

    --   1. Har bir kategoriya bo‘yicha nechta mahsulot sotilganini toping.
    --   2. Har bir kategoriya bo‘yicha jami sotuv summasini chiqaring.
    --   3. Har bir kategoriya bo‘yicha o‘rtacha narxni hisoblang.
    --   4. Har bir kun bo‘yicha jami tushumni toping.
    --   5. Faqat Electronics kategoriyasidagi mahsulotlar bo‘yicha umumiy tushumni hisoblang.
    --   6. Jami sotuv summasi 2000 dan katta bo‘lgan kategoriyalarni chiqaring.
    --   7. O‘rtacha narxi 100 dan yuqori bo‘lgan kategoriyalarni toping.
    --   8. 2025-01-01 sanasida nechta mahsulot sotilganini aniqlang.
    --   9. Eng ko‘p miqdorda (quantity) sotilgan kategoriyani toping.
    --   10. 3 martadan ko‘p sotilgan (quantity > 3) mahsulotlar bo‘yicha kategoriyalar kesimida jami tushumni chiqaring.

    --ESLATMA:
    --- JOIN ishlatilmaydi
    --- WHERE — guruhlashdan oldin
    --- HAVING — guruhlashdan keyin
    --- GROUP BY agregat funksiyalar bilan ishlatiladi







    --   1. Har bir kategoriya bo‘yicha nechta mahsulot sotilganini toping.



SELECT category, JSON_ARRAYAGG(product_name), COUNT(*) FROM sales GROUP BY category;


+-------------+-----------------------------------------+----------+
| category    | JSON_ARRAYAGG(product_name)             | COUNT(*) |
+-------------+-----------------------------------------+----------+
| Clothing    | ["T-shirt", "Jeans", "Jacket", "Shoes"] |        4 |
| Electronics | ["Laptop", "Phone", "TV", "Headphones"] |        4 |
| Food        | ["Apple", "Bread", "Milk", "Cheese"]    |        4 |
| Furniture   | ["Table", "Chair", "Sofa", "Bed"]       |        4 |
| Stationery  | ["Notebook", "Pen", "Marker", "Folder"] |        4 |
+-------------+-----------------------------------------+----------+




    --   2. Har bir kategoriya bo‘yicha jami sotuv summasini chiqaring.


SELECT category, sum(price*quantity)  as jami_suma FROM sales GROUP BY category; 



+-------------+-----------+
| category    | jami_suma |
+-------------+-----------+
| Electronics |      5050 |
| Furniture   |      2800 |
| Clothing    |      1050 |
| Food        |       165 |
| Stationery  |       196 |
+-------------+-----------+




    --   3. Har bir kategoriya bo‘yicha o‘rtacha narxni hisoblang.


SELECT category, sum(price*quantity) / sum(quantity) as ortacha_suma FROM sales GROUP BY category; 


+-------------+--------------+
| category    | ortacha_suma |
+-------------+--------------+
| Electronics |     459.0909 |
| Furniture   |     400.0000 |
| Clothing    |      70.0000 |
| Food        |       3.3000 |
| Stationery  |       3.5636 |
+-------------+--------------+







    --   4. Har bir kun bo‘yicha jami tushumni toping.



SELECT sale_date, sum(price*quantity) + day(sale_date) as kunlik_tushum FROM sales GROUP BY sale_date ; 


+------------+---------------+
| sale_date  | kunlik_tushum |
+------------+---------------+
| 2025-01-01 |          4031 |
| 2025-01-02 |          1607 |
| 2025-01-03 |          2281 |
| 2025-01-04 |          1352 |
+------------+---------------+





    --   5. Faqat Electronics kategoriyasidagi mahsulotlar bo‘yicha umumiy tushumni hisoblang.



SELECT category, SUM(price * quantity) AS sum FROM sales GROUP BY category HAVING category = "Electronics";
+-------------+------+
| category    | sum  |
+-------------+------+
| Electronics | 5050 |
+-------------+------+







    --   6. Jami sotuv summasi 2000 dan katta bo‘lgan kategoriyalarni chiqaring.



SELECT category,  SUM(price * quantity) AS sum FROM sales GROUP BY category HAVING sum > 2000;



+-------------+------+
| category    | sum  |
+-------------+------+
| Electronics | 5050 |
| Furniture   | 2800 |
+-------------+------+



    --   7. O‘rtacha narxi 100 dan yuqori bo‘lgan kategoriyalarni toping.


SELECT category,  sum(price*quantity) / sum(quantity) as ortacha from sales GROUP BY category HAVING ortacha >100;

+-------------+----------+
| category    | ortacha  |
+-------------+----------+
| Electronics | 459.0909 |
| Furniture   | 400.0000 |
+-------------+----------+



    --   8. 2025-01-01 sanasida nechta mahsulot sotilganini aniqlang.




SELECT sale_date, COUNT(*) FROM sales GROUP BY sale_date HAVING sale_date = "2025-01-01";


+------------+----------+
| sale_date  | COUNT(*) |
+------------+----------+
| 2025-01-01 |        6 |
+------------+----------+





    --   9. Eng ko‘p miqdorda (quantity) sotilgan kategoriyani toping.

SELECT category, sum(quantity) as kopi from sales GROUP BY category order by sum(quantity) DESC LIMIT 1;

+------------+------+
| category   | kopi |
+------------+------+
| Stationery |   55 |
+------------+------+



    --   10. 3 martadan ko‘p sotilgan (quantity > 3) mahsulotlar bo‘yicha kategoriyalar kesimida jami tushumni chiqaring.



select category, sum(price*quantity) as suma from sales WHERE quantity > 3 GROUP by category;



+-------------+------+
| category    | suma |
+-------------+------+
| Electronics |  750 |
| Furniture   |  400 |
| Clothing    |  600 |
| Food        |  165 |
| Stationery  |  196 |
+-------------+------+

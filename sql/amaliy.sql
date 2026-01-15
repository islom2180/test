show databases;

CREATE database student;

CREATE TABLE info(id INT, name VARCHAR(50), second TEXT, age SMALLINT, score INT); 


INSERT INTO info VALUES
        (1, "oDINA", "Karimova", 20,70); 
        (2, "Jaxongir", "Asasdov", 17,  80);
        (3, "Mirjalol", "Turobov", 23, 90); 
        (4, "oDINA", "Karimova", 20,60);
        (5, "ali", "Asasdov", 17,  100);
        (6, "vali", "Turobov", 23, 90);
        (1, "madi", "Karimova", 20,60); 
        (2, "axmad", "Asasdov", 17,  80);
        (3, "axad", "Turobov", 23, 90);


SELECT * FROM info;

SELECT name, second FROM info;


SELECT * FROM info WHERE score BETWEEN 90 AND 101  ORDER by name;



select * from info order by name;






-- birinchi masalnani sharti 

 MySQL  localhost:33060+ ssl  student  SQL > SELECT * FROM info WHERE score BETWEEN 90 AND 101  ORDER by name;
+----+----------+---------+-----+-------+
| id | name     | second  | age | score |
+----+----------+---------+-----+-------+
|  5 | ali      | Asasdov |  17 |   100 |
|  3 | axad     | Turobov |  23 |    90 |
|  3 | Mirjalol | Turobov |  23 |    90 |
|  6 | vali     | Turobov |  23 |    90 |
+----+----------+---------+-----+-------+



-- masalani ikinchi sharti


4 rows in set (0.0008 sec)
 MySQL  localhost:33060+ ssl  student  SQL > SELECT * FROM info WHERE score BETWEEN 70 AND 90  ORDER by name;
+----+----------+----------+-----+-------+
| id | name     | second   | age | score |
+----+----------+----------+-----+-------+
|  3 | axad     | Turobov  |  23 |    90 |
|  2 | axmad    | Asasdov  |  17 |    80 |
|  2 | Jaxongir | Asasdov  |  17 |    80 |
|  3 | Mirjalol | Turobov  |  23 |    90 |
|  1 | oDINA    | Karimova |  20 |    70 |
|  6 | vali     | Turobov  |  23 |    90 |
+----+----------+----------+-----+-------+


-- masalani uchinchi sharti


6 rows in set (0.0009 sec)
 MySQL  localhost:33060+ ssl  student  SQL > SELECT * FROM info WHERE score BETWEEN 60 AND 70  ORDER by name;
+----+-------+----------+-----+-------+
| id | name  | second   | age | score |
+----+-------+----------+-----+-------+
|  1 | madi  | Karimova |  20 |    60 |
|  1 | oDINA | Karimova |  20 |    70 |
|  4 | oDINA | Karimova |  20 |    60 |
+----+-------+----------+-----+-------+
3 rows in set (0.0008 sec)
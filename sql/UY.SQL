--3
    SELECT a.name, JSON_ARRAYAGG(g.name), COUNT(*) FROM book AS b
        JOIN author AS a ON a.id = b.author_id
        JOIN genre AS g ON g.id = b.genre_id
        GROUP BY a.id;
+----------------+-------------------------------------------------------------+----------+
| name           | JSON_ARRAYAGG(g.name)                                       | COUNT(*) |
+----------------+-------------------------------------------------------------+----------+
| Alisher Navoiy | ["Horror", "Badiiy", "Ilmiy", "Horror", "Badiiy", "Badiiy"] |        6 |
| Oybek          | ["Ilmiy", "Ilmiy", "Badiiy"]                                |        3 |
| Zulfiya        | ["Ilmiy", "Badiiy", "Horror", "Horror"]                     |        4 |
| Pushkin        | ["Badiiy", "Ilmiy", "Horror", "Ilmiy"]                      |        4 |
+----------------+-------------------------------------------------------------+----------+

--4
SELECT g.name, COUNT(*) AS miqdor FROM book AS b
JOIN genre AS g ON g.id = b.genre_id
GROUP BY g.id
ORDER BY miqdor DESC LIMIT 1;
+--------+--------+
| name   | miqdor |
+--------+--------+
| Badiiy |      6 |
+--------+--------+
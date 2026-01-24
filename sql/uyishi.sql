

---------------------------------------------------------------------------------------------------

CREATE TABLE genre(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL UNIQUE);

INSERT INTO genre(name) VALUES("Badiiy"), ("Ilmiy"), ("Horror");

CREATE TABLE author(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50) NOT NULL UNIQUE);
INSERT INTO author(name) VALUES("Alisher Navoiy"),("Oybek"),("Zulfiya"),("Pushkin");

CREATE TABLE books(id INT AUTO_INCREMENT PRIMARY KEY, 
                    name VARCHAR(50) NOT NULL,
                    price REAL,
                    sold SMALLINT,
                    genre_id INT,
                    author_id INT,
                    FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE ON UPDATE CASCADE,
                    FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("1984", 72000, 85, 1, 4);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Harry Potter", 200000, 50, 3, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Garov", 12000, 140, 2, 3);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Sariq Devni minib", 80000, 150, 2, 2);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Ming bir kecha", 2000, 5, 1, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Hamsa", 7000, 3, 1, 3);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Islom olami", 2000, 2000, 2, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Zolotoy Braslet", 45000, 1000, 3, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Yapon Zobiti", 78000, 4, 3, 3);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Voyna i Mir", 7200, 5, 2, 4);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Zolushka", 79000, 2, 1, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Oppog'oy", 700, 5, 3, 3);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Ne Tupi", 80000, 77, 2, 2);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("MEN", 720, 85, 1, 1);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("O'tgan KUnlar", 2000, 85, 1, 2);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Temur Tuzuklari", 22000, 85, 3, 4);
INSERT INTO books(name, price, sold, genre_id, author_id) VALUES("Boy bo'lish sirlari", 2000, 85, 2, 4);


-- 1

SELECT DISTINCT g.name AS janr_nomi
FROM books b
JOIN author a ON b.author_id = a.id
JOIN genre g ON b.genre_id = g.id
WHERE a.name = 'Alisher Navoiy';



-- 2


SELECT DISTINCT
    a.name AS muallif,
    g.name AS janr
FROM books b
JOIN author a ON b.author_id = a.id
JOIN genre g ON b.genre_id = g.id
ORDER BY a.name, g.name;


-- 3


SELECT a.name, JSON_ARRAYAGG(g.name), COUNT(*) FROM books AS b
JOIN author AS a ON a.id = b.author_id
JOIN genre AS g ON g.id = b.genre_id
GROUP BY a.id;


-- 4

SELECT g.name, COUNT(*) AS miqdor FROM books AS b
JOIN genre AS g ON g.id = b.genre_id
GROUP BY g.id
ORDER BY miqdor DESC LIMIT 1;


-- 5

SELECT a.id AS author_id, a.name AS muallif, g.name AS janr, COUNT(*) AS kitob_soni
FROM books b
JOIN author a ON b.author_id = a.id
JOIN genre g ON b.genre_id = g.id
GROUP BY a.id, a.name, g.name;

-- 6


SELECT a.name AS muallif, SUM(b.sold) AS jami_sotilgan
FROM books b
JOIN author a ON b.author_id = a.id
GROUP BY a.id, a.name
ORDER BY jami_sotilgan DESC limit 1;
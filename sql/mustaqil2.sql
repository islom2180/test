CREATE database liblary;

use liblary;

CREATE TABLE book
    (BookID INT AUTO_INCREMENT PRIMARY KEY,       -- Kitobning yagona identifikatori
    Title VARCHAR(200) NOT NULL,                 -- Kitob nomi
    Author VARCHAR(100) NOT NULL,                -- Muallif ismi
    Genre VARCHAR(50) NOT NULL,                  -- Janri
    YearPublished YEAR NOT NULL,                 -- Chop etilgan yili
    PageCount INT NOT NULL,                      -- Sahifalar soni
    Price DECIMAL(10,2) DEFAULT 0,               -- Narxi (so‘mda)
    Available BOOLEAN DEFAULT TRUE               -- Kutubxonada mavjudligi
);


INSERT INTO book (Title,Author,Genre,YearPublished,PageCount,price,Available)
VALUES
('Python Dasturlash', 'Alisher Tursunov', 'Programming', 2018, 350, 75000, TRUE),
('Sevgi Hikoyalari', 'Ali Islomov', 'Romance', 2016, 200, 5000, TRUE),
('Tarixiy Roman', 'Anvar Karimov', 'History', 2014, 420, 600, FALSE),
('Fantasy Dunyo', 'Alijon Rahmatov', 'Fantasy', 2019, 500, 8000, TRUE),
('Matematika Asoslari', 'Alisher Tursunov', 'Education', 2020, 300, 700, TRUE),
('Jahon Adabiyoti', 'Ali Nuriyev', 'Literature', 2017, 450, 90, TRUE),
('Ilmiy Tadqiqotlar', 'Azizbek Akbarov', 'Science', 2015, 320, 6000, TRUE),
('Detektiv Sirlar', 'Alijon Rahmatov', 'Mystery', 2021, 380, 8500, TRUE),
('Ona Tili', 'Alisher Tursunov', 'Education', 2013, 280, 400, TRUE),
('Sarguzashtlar', 'Ali Islomov', 'Adventure', 2022, 470, 9500, TRUE),
('Dunyo Tarixi', 'Anvar Karimov', 'History', 2016, 520, 1000, TRUE),
('Psixologiya Asoslari', 'Azizbek Akbarov', 'Science', 2018, 360, 720, TRUE);


SELECT *from book;

select Tili from book WHERE YearPublished >2015;

































select * from student ORDER BY desc 






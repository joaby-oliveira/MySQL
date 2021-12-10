use joaby;

DROP TABLE IF EXISTS library;
CREATE TABLE IF NOT EXISTS library (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(100) NOT NULL,
    author_name VARCHAR(80) NOT NULL,
    author_gender CHAR(1) NOT NULL,
    pages_qtt INT(11) NOT NULL,
    publisher_name VARCHAR(80) NOT NULL,
    book_value DECIMAL(7,2) NOT NULL,
    UF CHAR(2) NOT NULL,
    publication_year YEAR NOT NULL
);


INSERT INTO library(book_name, author_name, author_gender, pages_qtt, publisher_name, book_value, UF, publication_year) VALUES
('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009),
('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018),
('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 149.9, 'RJ', 2009),
('Habitos Saudaveis', 'Eduardo Santos', 'M', 430, 'Supra', 79.99, 'RJ', 2019)


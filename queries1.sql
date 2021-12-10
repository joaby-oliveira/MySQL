-- Create database
drop database if exists joaby;
create database joaby;

-- Use joaby database
use joaby;

-- Create client table

drop table if exists clients;
create table clients ( 
    name VARCHAR(30),
    gender CHAR(1),
    email VARCHAR(30),
    CPF CHAR(11),
    phone VARCHAR(30),
    address VARCHAR(100)
);

INSERT INTO clients(name, gender, email, cpf, phone, address) VALUES ('Joaby', 'M', 'joaby@webline.com', '00000000000', '(14)0 0000-0000', 'Rua dos Marrecos'),
('João', 'M', 'joaby@webline.com', '00000000000', '(14)0 0000-0000', 'Rua Teste aaa'),
('Cléber', 'M', 'joaby@webline.com', '00000000000', '(14)0 0000-0000', 'Rua dossda asdAA');

SELECT * FROM clients;
SELECT name, gender, email, address, now() as TEMPO FROM clients;

SELECT name, gender, email, address, now() as TEMPO FROM clients WHERE address LIKE '%dos%';
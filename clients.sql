use joaby;

drop table if exists clients;
create table if not exists clients (
    id int primary key auto_increment,
    name varchar(30) not null,
    gender enum("M", "F"),
    email varchar(50) UNIQUE,
    CPF varchar(15)
);

drop table if exists address;
create table if not exists address (
    id int primary key auto_increment,
    street varchar(80) not null,
    number varchar(4),
    district varchar(80),
    UF char(2),
    city varchar(40),
    CEP char(9),
    id_client int not null unique,
    foreign key(id_client)
    references clients(id)
);

drop table if exists phone;
create table if not exists phone (
    id int primary key auto_increment,
    type ENUM('RES', 'COM', 'CEL') NOT NULL,
    number VARCHAR(10) NOT NULL,
    id_client int not null,
    foreign key (id_client)
    references clients(id)
);

INSERT INTO clients VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO clients VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO clients VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO clients VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO clients VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO clients VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO clients VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO clients VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO clients VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO clients VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO clients VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO clients VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO clients VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA GUEDES','CASCADURA','B. HORIZONTE','MG',1);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',3);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',4);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA ARAUJO LIMA','CENTRO','VITORIA','ES',5);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',6);
INSERT INTO address (street, district, city, uf, id_client) VALUES('AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',7);
INSERT INTO address (street, district, city, uf, id_client) VALUES('AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',8);
INSERT INTO address (street, district, city, uf, id_client) VALUES('ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',9);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA DA LAPA','LAPA','SAO PAULO','SP',10);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',12);
INSERT INTO address (street, district, city, uf, id_client) VALUES('RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',13);

INSERT INTO phone VALUES(NULL,'RES','68976565',1);
INSERT INTO phone VALUES(NULL,'CEL','99656675',2);
INSERT INTO phone VALUES(NULL,'CEL','33567765',3);
INSERT INTO phone VALUES(NULL,'CEL','88668786',4);
INSERT INTO phone VALUES(NULL,'COM','55689654',5);
INSERT INTO phone VALUES(NULL,'COM','88687979',6);
INSERT INTO phone VALUES(NULL,'COM','88965676',7);
INSERT INTO phone VALUES(NULL,'CEL','89966809',8);
INSERT INTO phone VALUES(NULL,'COM','88679978',9);
INSERT INTO phone VALUES(NULL,'CEL','99655768',10);
INSERT INTO phone VALUES(NULL,'RES','89955665',11);
INSERT INTO phone VALUES(NULL,'RES','77455786',12);
INSERT INTO phone VALUES(NULL,'RES','89766554',13);
INSERT INTO phone VALUES(NULL,'RES','77755785',14);
INSERT INTO phone VALUES(NULL,'COM','44522578',15);

update clients set email = "giovana@gmail.com"
where id = 3;

update clients set email = "lorena@gmail.com"
where id = 6;

update clients set email = "eduardo@gmail.com"
where id = 7;

/* All users */
select c.id, c.name, c.email, p.number, p.type, a.city from clients c
inner join address a
on c.id = a.id_client
inner join phone p
on c.id = p.id_client;

-- Men
select c.id, c.name
from clients c
where c.gender = 'M';

-- Women
select c.id, c.name
from clients c
where c.gender = 'F';

-- Fix men gender
update clients
set gender = 'M'
where id
in(8)

-- Change women gender
update clients
set gender = 'F'
where id
in(4, 5, 6, 10, 11)

-- Men and women count
select count(*) as Quantidade, gender as Sexo
from clients
group by gender;

-- Women who doesn't have phone and lives in the RJ Center
select c.id, c.email, a.district, a.uf, p.number
from clients c
inner join address a
on c.id = a.id_client
inner join phone p
on c.id = p.id_client
where p.number
and district like 'centro'
and uf = 'RJ'
and gender = 'F'
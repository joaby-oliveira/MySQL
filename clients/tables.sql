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

/* Most used DDL commands */
/* Create table */
create table poducts (
    id int not null primary key auto_increment,
    name varchar(80) not null,
    price FLOAT(7, 2) not null
);

/* Alter table */
-- Add column
alter table products
add column deliver int not null

-- Add column after
alter table products
add column deliver int not null after name

-- Drop column
alter table products
drop column name

-- Modify column
alter table products
modify column name varchar(100) not null

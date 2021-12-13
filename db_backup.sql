delimiter ;

create database if not exists shop;

use shop;

create table if not exists shop.products (
  id int primary key auto_increment,
  name varchar(80),
  price float(10, 2)
);

create database if not exists bkp_shop;

create table if not exists bkp_shop.bkp_products (
  id int primary key auto_increment,
  name varchar(80),
  price float(10, 2)
);

delimiter $

drop trigger if exists bkp_product_trigger$
create trigger bkp_product_trigger
before insert on products
for each row
begin
  insert into bkp_shop.bkp_products values
  (null, new.name, new.price);
end$

delimiter ;


insert into shop.products values
(null, 'Livro modelagem', 39.90),
(null, 'Livro modelagem', 9.90),
(null, 'Livro modelagem', 4.99),
(null, 'Livro modelagem', 57.90);

select * from bkp_shop.bkp_products;
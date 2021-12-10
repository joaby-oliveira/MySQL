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
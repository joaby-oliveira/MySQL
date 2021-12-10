/* Creating a view */
create view v_users as 

select c.id, c.name, c.email, p.number, p.type, a.city from clients c
inner join address a
on c.id = a.id_client
inner join phone p
on c.id = p.id_client;

/* Showing a view */
select * from v_users;

/* Showing views */
show tables;
/* All users */
select
  c.id,
  c.name,
  ifnull(c.email, 'n/a'),
  p.number,
  p.type,
  a.city
from clients c
inner join address a
on c.id = a.id_client
inner join phone p
on c.id = p.id_client;


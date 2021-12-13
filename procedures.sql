/* Procedures without params */
delimiter $

create procedure nome_empresa()
begin
  select 'universidade dos dados' as empresa;
end
$

CALL nome_empresa()$


/* Procedures with params */

create procedure somar(n1 INT, n2 INT)
begin
  select n1 + n2 as conta;
end
$

CALL somar(1, 70)$

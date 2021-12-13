delimiter $

create procedure nome_empresa()
begin
  select 'universidade dos dados' as empresa;
end
$

CALL nome_empresa()$

/* Procedures with queries */
delimiter $

drop procedure if exists register_client$

create procedure register_client(name varchar(30),
                                 gender enum("M", "F"),
                                 email varchar(50),
                                 cpf varchar(15),
                                 street varchar(80),
                                 district varchar(80),
                                 city varchar(40),
                                 uf char(2),
                                 type enum('RES', 'COM', 'CEL'),
                                 number varchar(10))
begin
  /* Store user_id in a variable */
  DECLARE user_id INT DEFAULT 0;
  
  /* Insert clients data */
  insert into clients values(null, name, gender, email, cpf);


  SET user_id = last_insert_id();

  /* Insert address data */
  INSERT INTO address (street, district, city, uf, id_client) VALUES(street, district, city, uf, user_id);

  /* Insert phone data */
  INSERT INTO phone VALUES(null, type, number, user_id);
  
  select * from clients c
  inner join address a
  on c.id = a.id_client
  inner join phone p
  on c.id = p.id_client
  where c.id = user_id;
  
end
$

delimiter ;

call register_client('Joaby', 'M', 'joaby@gmail.com-8', '11111111111', 'Rua Teste', 'Cascamoles', 'São Paulo', 'SP', 'CEL', '1400000000');
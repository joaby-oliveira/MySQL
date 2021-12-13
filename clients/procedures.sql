/* Procedures with queries */
delimiter $

create procedure register_client(name varchar(30),
                                 gender enum("M", "F"),
                                 email varchar(50),
                                 cpf varchar(15))
begin
  insert into clients values(null, name, gender, email, cpf);
end
$

delimiter ;

call register_client('Joaby', 'M', 'joaby@gmail.com', '11111111111');
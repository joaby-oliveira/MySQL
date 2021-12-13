DELIMITER ;

use joaby;

drop table if exists students;
create table if not exists students (
  id int primary key auto_increment,
  name varchar(30),
  login varchar(30),
  password varchar(100)
);

drop table if exists bkp_students;
create table if not exists bkp_students (
  id int primary key auto_increment,
  name varchar(30),
  login varchar(30),
  password varchar(100)
);

DELIMITER $

drop TRIGGER if exists trigger_bkp_students$

CREATE TRIGGER trigger_bkp_students
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
  insert into bkp_students values
  (null, old.name, old.login, old.password);
END$

DELIMITER ;

insert into students values
(null, 'Joaby 1', 'jojo-1', '1234'),
(null, 'Joaby a', 'joj0', '1234'),
(null, 'Joaby b', 'jojo1', '1234');

select * from students;

delete from students where id = 1;

select * from bkp_students;
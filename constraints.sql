create table player (
  id int primary key auto_increment,
  nome varchar(30)
);

create table teams (
  id int primary key auto_increment,
  nome varchar(30),
  id_player int,
  foreign key (id_player)
  references player(id)
);

insert into player values (null, 'guerrero');
insert into teams values (null, 'flamengo', 1);

show create table player;
show create table teams;
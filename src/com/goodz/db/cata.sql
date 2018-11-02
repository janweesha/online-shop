create database if not exists goodz;

use goodz;

drop table if exists cata;
create table if not exists cata(
	c_id int(5) not null primary key,
	c_name varchar(50) not null unique
);

insert into cata(c_id,c_name) values(1,'手机数码'),(2,'电脑办公'),(3,'书籍文具'),(4,'手办玩具'),(5,'衣物被褥');
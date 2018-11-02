drop database if exists goodz;
create database if not exists goodz;

use goodz;

drop table if exists admin;
create table if not exists admin(
	a_id int(5) not null primary key,
	a_name varchar(20) not null unique,
	a_pwd varchar(50) not null
);

insert into admin(a_id,a_name,a_pwd) values(1,'root','123456');

select a_id as 管理员ID,a_name as 管理员姓名,a_pwd as 管理员密码 from admin;
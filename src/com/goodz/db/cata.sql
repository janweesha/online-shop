create database if not exists goodz;

use goodz;

drop table if exists cata;
create table if not exists cata(
	c_id int(5) not null primary key,
	c_name varchar(50) not null unique
);

insert into cata(c_id,c_name) values(1,'�ֻ�����'),(2,'���԰칫'),(3,'�鼮�ľ�'),(4,'�ְ����'),(5,'���ﱻ��');
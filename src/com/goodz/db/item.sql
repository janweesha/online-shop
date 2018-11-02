create database if not exists goodz;

use goodz;

drop table if exists item;
create table if not exists item(
	i_id int(5) primary key,
	i_name varchar(200) not null,
	c_id int(5) not null,
	u_id int(5) not null,
	i_num int(80) not null,
	i_price double,
	i_img varchar(200),
	i_date date,
	i_state int(1)
);

insert into item(i_id,i_name,c_id,u_id,i_num,i_price) values 
	(1,'小米4C标准版',1,1,1,800),
	(2,'Beats Solo3 Wireless 头戴式 蓝牙无线耳机 手机耳机 游戏',1,1,1,800),
	(3,'Apple iPhone X (A1865) 64GB 深空灰色 ',1,1,1,800),
	(4,'魅族 M15 全面屏手机 全网通公开版 4GB ',1,1,1,800),
	(5,'小米4C标准版',1,1,1,800),
	(6,'Beats Solo3 Wireless 头戴式 蓝牙无线耳机 手机耳机 游戏',1,1,1,800),
	(7,'Apple iPhone X (A1865) 64GB 深空灰色 ',1,1,1,800),
	(8,'魅族 M15 全面屏手机 全网通公开版 4GB ',1,1,1,800),
	(9,'小米4C标准版',1,1,1,800),
	(10,'Beats Solo3 Wireless 头戴式 蓝牙无线耳机 手机耳机 游戏',1,1,1,800),
	(11,'Apple iPhone X (A1865) 64GB 深空灰色 ',1,1,1,800),
	(12,'魅族 M15 全面屏手机 全网通公开版 4GB ',1,1,1,800),
	(13,'小米4C标准版',1,1,1,800),
	(14,'Beats Solo3 Wireless 头戴式 蓝牙无线耳机 手机耳机 游戏',1,1,1,800),
	(15,'Apple iPhone X (A1865) 64GB 深空灰色 ',1,1,1,800),
	(16,'魅族 M15 全面屏手机 全网通公开版 4GB ',1,1,1,800);
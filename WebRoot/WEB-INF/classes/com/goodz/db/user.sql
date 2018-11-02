use goodz;

drop table if exists user;
create table if not exists user(
	u_id int(5) not null primary key auto_increment,
	u_name varchar(20) not null unique,
	u_pwd varchar(50) not null,
	u_head varchar(80),
	u_mail varchar(50),
	u_tel varchar(20),
	u_gender varchar(10),
	u_state int(1),
	u_code varchar(64)
);

insert into user(u_id,u_name,u_pwd,u_mail,u_tel,u_gender,u_state) 
values(1,'root','123456','1377860780@qq.com','18183102102','male',1);

select u_id as 用户ID,
	u_name as 用户名,
	u_pwd as 用户密码,
	u_head as 头像地址,
	u_mail as 邮箱,
	u_tel as 电话号码,
	u_gender as 性别,
	u_state as 是否激活,
	u_code as 激活码 
	from user;
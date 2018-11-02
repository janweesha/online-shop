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

select u_id as �û�ID,
	u_name as �û���,
	u_pwd as �û�����,
	u_head as ͷ���ַ,
	u_mail as ����,
	u_tel as �绰����,
	u_gender as �Ա�,
	u_state as �Ƿ񼤻�,
	u_code as ������ 
	from user;
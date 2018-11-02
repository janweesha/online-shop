package com.goodz.dao;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.goodz.entity.User;

@Component
public class UserDao implements IUserDao{
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public int addUser(User user) throws Exception
	{
		String sql="insert into user(u_id,u_name,u_pwd,u_mail,u_tel,u_gender,u_state,u_code) values(?,?,?,?,?,?,?,?)";
		try {
			return jdbcTemplate.update(sql, user.getU_id(), user.getU_name(),
					user.getU_pwd(), user.getU_mail(), user.getU_tel(),
					user.getU_gender(), user.getU_state(), user.getU_code());
		} catch (Exception e) {
			return -1;
		}
	}
	
	public User findByNameAndPwd(User user) throws Exception
	{
		try {
			String sql="select * from user where u_name=? and u_pwd=?";
			return jdbcTemplate.queryForObject(sql,
					new BeanPropertyRowMapper<User>(User.class), 
					user.getU_name(),user.getU_pwd());
		} catch (Exception e) {
			return null;
		}
	}
	
	public User findByName(String name) throws Exception
	{
		try {
			String sql="select * from user where u_name=?";
			return jdbcTemplate.queryForObject(sql,
					new BeanPropertyRowMapper<User>(User.class), 
					name);
		} catch (Exception e) {
			return null;
		}
	}
	
	public void insert(User user) throws SQLException
	{
		jdbcTemplate.getDataSource().getConnection().setAutoCommit(false);
		try {
			String sql="insert into user(u_id,u_name,u_pwd) values(?,?,?)";
			jdbcTemplate.update(sql, user.getU_id(),user.getU_name(),user.getU_pwd());
		} catch (Exception e)
		{
			e.printStackTrace();
			jdbcTemplate.getDataSource().getConnection().rollback();
		}
	}
	
	public int updateState(String name)
	{
		String sql="update user set u_state=1 where u_name=?";
		return jdbcTemplate.update(sql,name);
	}
	
	public int deleteByIds(String sql) throws Exception
	{
		return jdbcTemplate.update(sql);
	}
	
	public int updateHeadPath(String path,Integer id)
	{
		String sql="update user set u_head=? where u_id=?";
		return jdbcTemplate.update(sql,path,id);
	}
	
	@Test
	public void test() throws Exception
	{
		ApplicationContext ac=new ClassPathXmlApplicationContext("/spring.xml");
		IUserDao userDao=(IUserDao)ac.getBean("userDao");
		/*System.out.println(userDao.addUser(new User(2, "夏章伟", "123456")));*/
		/*System.out.println(userDao.findByNameAndPwd(new User(2, "夏章伟", "123456")));
		System.out.println(userDao.findByNameAndPwd(new User(2, "夏章伟", "123456"))==null);*/
		System.out.println(userDao.updateHeadPath("E:\\goodz\\user\\head\\head_1.jpg", 1));
	}
}

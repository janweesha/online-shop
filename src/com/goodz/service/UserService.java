package com.goodz.service;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.goodz.dao.IUserDao;
import com.goodz.entity.User;

@Component
public class UserService implements IUserService {
	
	@Resource(name="userDao")
	private IUserDao userDao;
	
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	@Transactional(value="transactionManager",propagation = Propagation.REQUIRES_NEW)
	public boolean addUser(User user) throws Exception
	{
		return (userDao.addUser(user)==1)?true:false;
	}
	
	public int deleteByIds(String... ids) throws Exception
	{
		String sql="delete from user where u_id in (";
		String subSql="";
		for(String id:ids)
		{
			subSql=subSql+id+",";
		}
		subSql=subSql.substring(0, subSql.length()-1)+")";
		sql=sql+subSql;
		return userDao.deleteByIds(sql);
	}
	
	public User findByNameAndPwd(User user) throws Exception
	{
		return userDao.findByNameAndPwd(user);
	}
	
	public User findByName(String name) throws Exception
	{
		return userDao.findByName(name);
	}
	
	public boolean active(String name)
	{
		return userDao.updateState(name)==1?true:false;
	}
	
	public boolean setHead(String path,Integer id)
	{
		return userDao.updateHeadPath(path, id)==1?true:false;
	}
	
	public static void main(String[] args) throws Exception
	{
		ApplicationContext ac=new ClassPathXmlApplicationContext("/spring.xml");
		IUserService userService=(IUserService)ac.getBean("userService");
		//userService.addUser(new User(25, "sha jan-wee", "123456"));
		System.out.println(userService.deleteByIds("1","2","3","4","5","6"));
	}
}

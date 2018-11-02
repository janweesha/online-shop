package com.goodz.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.goodz.entity.Cata;

@Component
public class CataDao {
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Cata> findAll()
	{
		String sql="select * from cata";
		List<Cata> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Cata>(Cata.class));
		return list;
	}
	
	public static void main(String[] args) {
		ApplicationContext ac=new ClassPathXmlApplicationContext("/spring.xml");
		CataDao cataDao=(CataDao)ac.getBean("cataDao");
		List<Cata> list=cataDao.findAll();
		for(Cata cata:list)
		{
			System.out.println(cata);
		}
	}
}

package com.goodz.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.goodz.entity.Item;

@Component
public class ItemDao {
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Item> findAll()
	{
		String sql="select * from item";
		List<Item> list=jdbcTemplate.query(sql, new BeanPropertyRowMapper<Item>(Item.class));
		return list;
	}
}

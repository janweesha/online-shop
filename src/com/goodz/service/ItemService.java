package com.goodz.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.goodz.dao.ItemDao;
import com.goodz.entity.Item;

@Component
public class ItemService {
	@Resource(name="itemDao")
	private ItemDao itemDao;

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public List<Item> findAll()
	{
		return itemDao.findAll();
	}

	//从redis中获取数据
	public List<Item> findAllFromRedis()
	{
		return null;
	}
}

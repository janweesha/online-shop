package com.goodz.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.goodz.dao.CataDao;
import com.goodz.entity.Cata;

@Component
public class CataService {
	@Resource(name="cataDao")
	private CataDao cataDao;

	public void setCataDao(CataDao cataDao) {
		this.cataDao = cataDao;
	}
	
	public List<Cata> findAll()
	{
		return cataDao.findAll();
	}

	//从redis中获取数据
	public List<Cata> findAllFromRedis()
	{
		return null;
	}
}

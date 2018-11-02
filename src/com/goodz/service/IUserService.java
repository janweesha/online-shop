package com.goodz.service;

import com.goodz.entity.User;

public interface IUserService {
	public boolean addUser(User user) throws Exception;
	public User findByNameAndPwd(User user) throws Exception;
	public User findByName(String name) throws Exception;
	public boolean active(String name);
	public int deleteByIds(String... ids) throws Exception;
	public boolean setHead(String path,Integer id);
}

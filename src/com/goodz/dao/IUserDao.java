package com.goodz.dao;

import java.sql.SQLException;

import com.goodz.entity.User;

public interface IUserDao {
	public int addUser(User user) throws Exception;
	public User findByNameAndPwd(User user) throws Exception;
	public User findByName(String name) throws Exception;
	public int updateState(String name);
	public void insert(User user) throws SQLException;
	public int deleteByIds(String sql) throws Exception;
	public int updateHeadPath(String path,Integer id);
}

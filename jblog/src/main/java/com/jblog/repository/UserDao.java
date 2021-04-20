package com.jblog.repository;

import com.jblog.vo.UserVo;

public interface UserDao {

	public int insert(UserVo vo);		//	INSERT
	public UserVo selectUser(String id, String password);	
	public UserVo selectUser(String id);
	
}

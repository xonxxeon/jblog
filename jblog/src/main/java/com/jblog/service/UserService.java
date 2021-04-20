package com.jblog.service;

import com.jblog.vo.UserVo;

public interface UserService {

	public boolean join(UserVo vo);		//	가입 (INSERT)
	public UserVo getUser(String id, String password);	//	로그인
	public UserVo getUser(String id);	//	중복id 체크
	
}

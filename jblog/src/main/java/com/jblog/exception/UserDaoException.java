package com.jblog.exception;

import com.jblog.vo.UserVo;

//	UserDao 예외처리를 위한 클래스
public class UserDaoException extends RuntimeException {

	private UserVo userVo = null;
	
	//	생성자
	public UserDaoException() {
	}
	
	public UserDaoException(String message) {
		super(message);
	}
	
	public UserDaoException(String message, UserVo userVo) {
		super(message);
		this.userVo = userVo;
	}

	//	Getter / Setter
	public UserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}

	//	toString
	@Override
	public String toString() {
		return "UserDaoException [userVo=" + userVo + "]";
	}
	
}

package com.jblog.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jblog.exception.UserDaoException;
import com.jblog.vo.UserVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	
	//	Logger
	private static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Transactional
	@Override
	public int insert(UserVo vo) {
		int insertedCount = 0;
		
		try {
			insertedCount = sqlSession.insert("users.insert", vo);
			vo.setUserName(vo.getUserName() + "의 블로그입니다.");
			sqlSession.insert("users.insertb", vo);
			sqlSession.insert("users.insertc", vo);
		} catch (Exception e) {
			
			logger.error("전체출력 : ");
			 e.printStackTrace();
			logger.error("예외 발생 : " + e.getMessage());
			throw new UserDaoException("회원 가입 중 오류 발생 ! ", vo);
		}
		return insertedCount;
	}

	//	email 과 password 로 사용자 찾기
	@Override
	public UserVo selectUser(String id, String password) {
		Map<String, String> userMap = new HashMap<>();
		userMap.put("id", id);
		userMap.put("password", password);
		
		UserVo vo = sqlSession.selectOne("users.selectUserByIdAndPassword", userMap);
		
		return vo;
	}

	@Override
	public UserVo selectUser(String id) {
		UserVo vo = sqlSession.selectOne("users.selectUserById", id);
		return vo;
	}

}

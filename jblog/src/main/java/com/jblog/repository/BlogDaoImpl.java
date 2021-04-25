package com.jblog.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jblog.vo.BlogVo;

@Repository("blogDao")
public class BlogDaoImpl implements BlogDao {

	@Autowired
	SqlSession sqlSession;
	
	@Transactional
	@Override
	public List<BlogVo> cateAll(String id) {
		
		List<BlogVo> list = sqlSession.selectList("blog.cateAll", id);
		
		return list;
	}

	@Override
	public int insert(BlogVo vo) {
		int insertedCount = sqlSession.insert("blog.insert", vo);
		return insertedCount;
	}
	
	@Override
	public int delete(BlogVo vo) {
		int deletedCount = sqlSession.delete("blog.delete", vo);
		return deletedCount;
	}

	@Override
	public int update(BlogVo vo) {
		int updatedCount = sqlSession.update("blog.update", vo);
		return updatedCount;
	}

	@Override
	public BlogVo getUser(String id) {
		BlogVo vo = sqlSession.selectOne("blog.getUser", id);
		return vo;
	}
	
	@Override
	public BlogVo getUserId(Long userNo) {
		BlogVo vo = sqlSession.selectOne("blog.getUserId", userNo);
		return vo;
	}
	
	@Override
	public List<BlogVo> getPostCount(Long userNo) {
		List<BlogVo> list = sqlSession.selectList("blog.getPostCount", userNo);
		return list;
	}
	
	@Override
	public int writePost(BlogVo vo) {
		int insertedCount = sqlSession.insert("blog.writePost", vo);
		return insertedCount;
	}
	
	@Override
	public BlogVo mainPost(Long userNo) {
		BlogVo vo = sqlSession.selectOne("blog.mainPost", userNo);
		return vo;
	}
	
	@Override
	public List<BlogVo> mainList(Long userNo) {
		List<BlogVo> list = sqlSession.selectList("blog.mainList", userNo);
		return list;
	}

	@Override
	public BlogVo selCatePost(Long cateNo) {
		BlogVo vo = sqlSession.selectOne("blog.selCatePost", cateNo);
		return vo;
	}

	@Override
	public List<BlogVo> selCateList(Long cateNo) {
		List<BlogVo> list = sqlSession.selectList("blog.selCateList", cateNo);
		return list;
	}
	
	@Override
	public BlogVo selPost(Long postNo) {
		BlogVo vo = sqlSession.selectOne("blog.selPost", postNo);
		return vo;
	}
	
	@Override
	public int updateBlog(BlogVo vo) {
		int updatedCount = sqlSession.update("blog.updateBlog", vo);
		return updatedCount;
	}

	@Override
	public int addComment(BlogVo vo) {
		int insertedCount = sqlSession.insert("blog.addComment", vo);
		return insertedCount;
	}

	@Override
	public int delComment(BlogVo vo) {
		int deletedCount = sqlSession.delete("blog.delComment", vo);
		return deletedCount;
	}

	@Override
	public List<BlogVo> getComment(Long postNo) {
		List<BlogVo> list = sqlSession.selectList("blog.selComment", postNo);
		return list;
	}
	
}

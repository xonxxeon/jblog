package com.jblog.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.repository.BlogDao;
import com.jblog.vo.BlogVo;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Autowired
	BlogDao blogDaoImpl;
	
	@Override
	public List<BlogVo> getList(String id) {
		List<BlogVo> list = blogDaoImpl.cateAll(id);
		return list;
	}

	@Override
	public boolean addCate(BlogVo vo) {
		int insertedCount = blogDaoImpl.insert(vo);
		return insertedCount == 1;
	}
	
	@Override
	public boolean delCate(BlogVo vo) {
		int deletedCount = blogDaoImpl.delete(vo);
		return deletedCount == 1;
	}

	@Override
	public boolean updateCate(BlogVo vo) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public BlogVo getUser(String id) {
		BlogVo vo = blogDaoImpl.getUser(id);
		return vo;
	}
	
	@Override
	public BlogVo getUserId(Long userNo) {
		BlogVo vo = blogDaoImpl.getUserId(userNo);
		return vo;
	}
	
	@Override
	public List<BlogVo> getPostCount(Long userNo) {
		List<BlogVo> list = blogDaoImpl.getPostCount(userNo);
		return list;
	}
	
	@Override
	public boolean writePost(BlogVo vo) {
		int insertedCount = blogDaoImpl.writePost(vo);
		return insertedCount == 1;
	}
	
	@Override
	public BlogVo mainPost(Long userNo) {
		BlogVo vo = blogDaoImpl.mainPost(userNo);
		return vo;
	}
	
	@Override
	public List<BlogVo> mainList(Long userNo) {
		List<BlogVo> list = blogDaoImpl.mainList(userNo);
		return list;
	}

	@Override
	public BlogVo selCatePost(Long cateNo) {
		BlogVo vo = blogDaoImpl.selCatePost(cateNo);
		return vo;
	}

	@Override
	public List<BlogVo> selCateList(Long cateNo) {
		List<BlogVo> list = blogDaoImpl.selCateList(cateNo);
		return list;
	}
	
	@Override
	public BlogVo selPost(Long postNo) {
		BlogVo vo = blogDaoImpl.selPost(postNo);
		return vo;
	}
	
	@Override
	public boolean updateBlog(BlogVo vo) {
		int updatedCount = blogDaoImpl.updateBlog(vo);
		return updatedCount == 1;
	}

	@Override
	public boolean addComment(BlogVo vo) {
		int insertedCount = blogDaoImpl.addComment(vo);
		return insertedCount == 1;
	}

	@Override
	public boolean delComment(BlogVo vo) {
		int deletedCount = blogDaoImpl.delComment(vo);
		return deletedCount == 1;
	}
	
	public List<BlogVo> getComment(Long postNo){
		List<BlogVo> list = blogDaoImpl.getComment(postNo);
		return list;
	}
	
}

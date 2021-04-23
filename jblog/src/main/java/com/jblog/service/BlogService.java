package com.jblog.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jblog.vo.BlogVo;

public interface BlogService {
	
	public List<BlogVo> getList(String id);		//	카테고리 목록
	public boolean addCate(BlogVo vo);	//	카테고리 추가
	public boolean delCate(BlogVo vo);
	public boolean updateCate(BlogVo vo);	//	카테고리 업데이트
	public BlogVo getUser(String id);	//	id 확인
	
	public BlogVo getUserId(Long userNo);
	
	public List<BlogVo> getPostCount(Long userNo);
	
	public boolean writePost(BlogVo vo);	//	포스트 작성
	
	//	블로그 메인 표시 컨텐츠
	public BlogVo mainPost(Long userNo);
	public List<BlogVo> mainList(Long userNo);
	
	//	블로그 카테고리 선택 시 표시 컨텐츠
	public BlogVo selCatePost(Long cateNo);
	public List<BlogVo> selCateList(Long cateNo);
	
	//	포스트번호로 포스트불러오기
	public BlogVo selPost(Long postNo);
	
	//	블로그 정보 수정
	public boolean updateBlog(BlogVo vo);
}

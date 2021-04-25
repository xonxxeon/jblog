package com.jblog.repository;

import java.util.List;

import com.jblog.vo.BlogVo;

public interface BlogDao {
	
	public List<BlogVo> cateAll(String id);	//	카테고리뿌리기
	public int insert(BlogVo vo);	//	카테고리 추가
	public int delete(BlogVo vo);	//	카테고리 삭제
	public int update(BlogVo vo);	//	카테고리 수정
	public BlogVo getUser(String id);	//	id값 얻어오기
	public List<BlogVo> getPostCount(Long userNo);	//	카테고리목록
	public int writePost(BlogVo vo);	//	포스트 작성
	
	//	블로그 메인 표시 컨텐츠
	public BlogVo mainPost(Long userNo);
	public List<BlogVo> mainList(Long userNo);
	
	public BlogVo getUserId(Long userNo);
	
	//	블로그 카테고리 선택 시 표시 컨텐츠
	public BlogVo selCatePost(Long cateNo);
	public List<BlogVo> selCateList(Long cateNo);
	//	포스트 선택
	public BlogVo selPost(Long postNo);
	
	//	블로그 정보 업데이트
	public int updateBlog(BlogVo vo);
	
	//	코멘트 작성, 삭제, 조회
	public int addComment(BlogVo vo);
	public int delComment(BlogVo vo);
	public List<BlogVo> getComment(Long postNo);
	
}

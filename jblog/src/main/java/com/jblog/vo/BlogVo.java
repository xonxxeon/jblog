package com.jblog.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BlogVo {
	
	private String id;
	private Long userNo;
	private String userName;
	private Long cateNo;
	private String cateName;
	private String description;
	private Date regDate;
	private String blogTitle;
	private String logoFile;
	
	private Long postCount;
	
	private Long postNo;
	private String postTitle;
	private String postContent;
	
	public BlogVo() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getCateNo() {
		return cateNo;
	}

	public void setCateNo(Long cateNo) {
		this.cateNo = cateNo;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getLogoFile() {
		return logoFile;
	}

	public void setLogoFile(String logoFile) {
		this.logoFile = logoFile;
	}

	public Long getPostCount() {
		return postCount;
	}

	public void setPostCount(Long postCount) {
		this.postCount = postCount;
	}

	public Long getPostNo() {
		return postNo;
	}

	public void setPostNo(Long postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	@Override
	public String toString() {
		return "BlogVo [id=" + id + ", userNo=" + userNo + ", userName=" + userName + ", cateNo=" + cateNo
				+ ", cateName=" + cateName + ", description=" + description + ", regDate=" + regDate + ", blogTitle="
				+ blogTitle + ", logoFile=" + logoFile + ", postCount=" + postCount + ", postNo=" + postNo
				+ ", postTitle=" + postTitle + ", postContent=" + postContent + "]";
	}

}

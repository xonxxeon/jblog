package com.jblog.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jblog.service.BlogService;
import com.jblog.service.FileUploadService;
import com.jblog.vo.BlogVo;


@Controller
@RequestMapping
public class BlogController {
	
	//	로거 연결
	private static Logger logger = LoggerFactory.getLogger(BlogController.class);
	
	//	서비스 연결
	@Autowired
	BlogService blogServiceImpl;
	@Autowired
	FileUploadService fileUploadService;
	
	@RequestMapping("/{id}")
	public String cate(@PathVariable String id,
						@RequestParam(value="cateNo", required=false) Long cateNo,
						@RequestParam(value="postNo", required=false) Long postNo,Model model) {
		
		logger.debug("=======================================");
		logger.debug("카테고리 번호 받아오기 : " + cateNo);
		logger.debug("포스트 번호 받아오기 : " + postNo);
		BlogVo vo = blogServiceImpl.getUser(id);
		logger.debug("블로그 주인 정보 : " + vo);
		logger.debug("블로그 주인 id : " + id);
		logger.debug("=======================================");
		
		//	블로그 주인 userNo 받아오기
		Long userNo = vo.getUserNo();
		logger.debug("블로그 주인 userNo : " + userNo);
		
		//	카테고리 목록 받아오기
		List<BlogVo> list = blogServiceImpl.getList(id);
		
		//	카테고리 번호 정보가 없으면 : 블로그 진입 초기
		if(cateNo == null) {
			//	포스트,리스트 받아오기
			logger.debug("! 진입경로 : 메인 -------------");
			List<BlogVo> mainList = blogServiceImpl.mainList(userNo);
			BlogVo mainPost = blogServiceImpl.mainPost(userNo);
			
			//	메인포스트가 있을 때에만 코멘트 정보 불러옴
			if(mainPost != null) {
				postNo = mainPost.getPostNo();
				List<BlogVo> cmt = blogServiceImpl.getComment(postNo);
				logger.debug("cmt vo : " + cmt);
				logger.debug("메인 post vo : " + mainPost);
				
				model.addAttribute("cmt", cmt);
			}
			
			
			model.addAttribute(id);
			model.addAttribute("mainPost", mainPost);
			model.addAttribute("mainList", mainList);
			logger.debug("----------------------------");
		} else {	//	카테고리 번호 정보가 있으면 : 카테고리 클릭
			
			//	포스트 번호 정보가 없으면 : 카테고리 클릭
			if(postNo == null) {
				logger.debug("! 진입경로 : 메인 - 카테고리");
				BlogVo cateNoVo = blogServiceImpl.selCatePost(cateNo);
				model.addAttribute("mainPost", cateNoVo);
				logger.debug("----------------------------");
			} else {	//	포스트 번호 정보가 있으면 : 카테고리 - 포스트클릭
				logger.debug("! 진입경로 : 포스트 선택");
				BlogVo selPost = blogServiceImpl.selPost(postNo);
				model.addAttribute("mainPost", selPost);
				logger.debug("카테고리-포스트클릭 : " + selPost);
				
				List<BlogVo> cmt = blogServiceImpl.getComment(postNo);
				model.addAttribute("cmt", cmt);
				logger.debug("cmt vo : " + cmt);
				logger.debug("----------------------------");
			}
			
			BlogVo getUser = blogServiceImpl.getUser(id);
			
			logger.debug("getUserInfo : " + getUser);
			logger.debug("get cateNo : " + cateNo);
			
			
			List<BlogVo> cateNoList = blogServiceImpl.selCateList(cateNo);
			model.addAttribute(id);
			
			model.addAttribute("vo", getUser);
			model.addAttribute("mainList", cateNoList);
			
		}
		
		//	모델에 실어서 View로 전달
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		logger.debug("vo : " + vo);
		
		logger.debug("블로그 타이틀 : " + vo.getBlogTitle());

		return "blog/blog";
	}

	
	@RequestMapping("/{id}/admin/basic")
	public String adminb(@PathVariable String id, Model model) {
		
		BlogVo vo = blogServiceImpl.getUser(id);
		
		model.addAttribute("vo", vo);
		
		logger.debug("basic vo : " + vo);
		
		return "admin/basic";
	}
	
	@RequestMapping("/{id}/admin/category")
	public String adminc(@PathVariable String id, Model model) {
		
		BlogVo vo = blogServiceImpl.getUser(id);
		Long userNo = vo.getUserNo();
		
		
		List<BlogVo> list = blogServiceImpl.getPostCount(userNo);
		
		logger.debug("카테고리 리스트 : " + list);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		logger.debug("확인용 userNo : "+ userNo);
		logger.debug("확인용 id : "+ id);
		
		return "admin/category";
	}
	
	@RequestMapping("/{id}/admin/write")
	public String adminw(@PathVariable String id, Model model) {
		
		BlogVo vo = blogServiceImpl.getUser(id);
		List<BlogVo> list = blogServiceImpl.getList(id);
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "admin/write";
	}
	
	@RequestMapping(value="/addcmt", method=RequestMethod.POST)
	public String addCmt(@ModelAttribute BlogVo vo, Model model) {
		Long userNo = vo.getUserNo();
		String id = vo.getBlogId();
		
		Long cateNo = vo.getCateNo();
		Long postNo = vo.getPostNo();
		logger.debug("[코멘트작성]추가데이터 : " + vo);
		
		boolean success = blogServiceImpl.addComment(vo);
		
		logger.debug("[코멘트작성] 성공여부 : " + success);
		
		return "redirect:/" + id + "?postNo=" + postNo + "&cateNo=" + cateNo;
	}
	
	@RequestMapping(value="/delcmt", method=RequestMethod.POST)
	public String delCmt(@ModelAttribute BlogVo vo, Model model) {
		Long userNo = vo.getUserNo();
		String id = vo.getBlogId();
		
		Long cateNo = vo.getCateNo();
		Long postNo = vo.getPostNo();
		
		boolean success = blogServiceImpl.delComment(vo);
		
		logger.debug("[코멘트삭제] 성공여부 : " + success);
		
		return "redirect:/" + id + "?postNo=" + postNo + "&cateNo=" + cateNo;
	}
	
	@RequestMapping(value="/addCate", method=RequestMethod.POST)
	public String cateAdd(@ModelAttribute BlogVo vo, HttpSession session) {
		
		String id = vo.getId();
		
		logger.debug("[addCate]추가데이터 : " + vo);
		logger.debug("[addCate]받아온 아이디 : " + id);
		
		boolean success = blogServiceImpl.addCate(vo);
		
		logger.debug("[addCate]카테고리 추가 결과 : " + success);
		
		return "redirect:/" + id + "/admin/category";
	}
	
	@RequestMapping(value="/delCate", method=RequestMethod.POST)
	public String cateDel(@ModelAttribute BlogVo vo, HttpSession session) {

		Long userNo = vo.getUserNo();
		BlogVo getid = blogServiceImpl.getUserId(userNo);
		
		String id = getid.getId();
		
		logger.debug("[delCate]delcate vo : " + vo);
		logger.debug("[delCate]받아온 id : " + id);
		
		boolean success = blogServiceImpl.delCate(vo);
		
		return "redirect:/" + id + "/admin/category";
	}
	
	@RequestMapping(value="/writePost", method=RequestMethod.POST)
	public String writePost(@ModelAttribute BlogVo vo, HttpSession session) {
		String id = vo.getId();
		
		logger.debug("포스트 vo : " + vo);
		
		boolean success = blogServiceImpl.writePost(vo);
		
		logger.debug("포스트 작성 결과 : " + success);
		
		return "redirect:/" + id + "/admin/write";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String blogUpload(@ModelAttribute BlogVo vo,
							@RequestParam MultipartFile multipartFile,
							@RequestParam String blogTitle) {
		//	id 받아오기
		String id = vo.getId();
		//	id로 사용자 정보 받아오기
		BlogVo uNo = blogServiceImpl.getUser(id);
		//	사용자 번호 userNo에 저장
		Long userNo = uNo.getUserNo();
		//	이미지 파일 받아오기
		String saveFilename = fileUploadService.store(multipartFile);
		//	등록된 이미지 받아오기
		String defImg = uNo.getLogoFile();
		logger.debug("upload GET deffile기본값 : " + defImg);
		//	이미지 파일 추가 안하고 전송 시 기존 등록된 이미지로 대체
		if(saveFilename.equals("")) {
			saveFilename = defImg;
		}
		
		logger.debug("upload GET ID : " + id);
		logger.debug("upload GET userNo : " + userNo);
		logger.debug("upload GET savefile : " + saveFilename);
		logger.debug("upload GET deffile : " + defImg);
		
		BlogVo updateVo = new BlogVo();
		updateVo.setBlogTitle(blogTitle);
		updateVo.setLogoFile(saveFilename);
		updateVo.setUserNo(userNo);
		updateVo.setId(id);
		logger.debug("upload GET vo " + vo);
		boolean success = blogServiceImpl.updateBlog(updateVo);
		
		if(success) {
			return "redirect:/" + id + "/admin/basic";
		} else {
			return "redirect:/" + id + "/admin/basic";
		}
		
	}
	
}

package com.jblog.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jblog.repository.UserDaoImpl;
import com.jblog.service.UserService;
import com.jblog.vo.UserVo;

@Controller
@RequestMapping("/users")
public class UserController {
	
	//	로거
	private static Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
	
	//	서비스 연결
	@Autowired
	private UserService userService;
	
	//	회원가입 폼
	@RequestMapping(value= {"", "/", "join"}, method=RequestMethod.GET)
	public String join() {
		return "users/joinForm";
	}
	
	//	가입 처리
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinAction(@ModelAttribute UserVo userVo) {
		
		logger.debug("Form에 전송된 데이터 : " + userVo);
		
		boolean success = userService.join(userVo);
		
		if(success) {
			logger.debug("회원 가입 성공 !");
			return "redirect:/users/joinsuccess";
		} else {
			logger.error("회원 가입 실패 !");
			return "redirect:/users/";
		}
		
	}
	
	//	회원가입 성공 페이지
	@RequestMapping("/joinsuccess")
	public String joinSuccess() {
		return "members/joinsuccess";
	}
	
	//	JSON 매핑 확인
	@ResponseBody	//	MessageConverter 작동
	@RequestMapping("/show")
	public Object showUserByEmail(@RequestParam String id) {
		UserVo vo = userService.getUser(id);
		return vo;
	}
	
	//	중복 아이디 체크
	@ResponseBody
	@RequestMapping("/idcheck")
	public Object existsId(
			@RequestParam(value="id", required=false, defaultValue="") String id) {
		
		UserVo vo = userService.getUser(id);
		boolean exists = vo != null ? true: false; //	vo 객체가 null 이면 존재하는 아이디
		
		//	결과 MAP -> 컨버터 -> JSON 변환
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		map.put("data", exists);
		
		return map;
	}
	

}

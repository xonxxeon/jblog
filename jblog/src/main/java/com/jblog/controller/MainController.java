package com.jblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping({"", "/"})
	public ModelAndView index() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		//	전달된 ViewName 을 기반으로 ViewResolver에게 실제 위치를 질의
		
		return mav;
	}

}

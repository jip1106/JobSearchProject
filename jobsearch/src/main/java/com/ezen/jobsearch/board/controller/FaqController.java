package com.ezen.jobsearch.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FaqController {
	private Logger logger
		=LoggerFactory.getLogger(FaqController.class);
	
	@RequestMapping(value = "/faq/list.do")
	public String list() {
		logger.info("FAQ 목록");
		
		return "board/faqList";
	}
	
	@RequestMapping(value = "/admin/faq/write.do", method = RequestMethod.GET)
	public String write_get() {
		logger.info("FAQ작성 화면");
		
		return "admin/admin-board/faqWrite";
	}
}

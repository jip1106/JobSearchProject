package com.ezen.jobsearch.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	private Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value = "/notice/list.do")
	public String list() {
		logger.info("공지사항 목록");
		
		return "board/noticeList";
	}
	
	@RequestMapping(value = "/admin/notice/write.do", method = RequestMethod.GET)
	public String write_get() {
		logger.info("공지사항 작성 화면");
		
		return "admin/admin-board/noticeWrite";
	}
}

package com.ezen.jobsearch.scrap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScrapController {
	private final Logger logger
		=LoggerFactory.getLogger(ScrapController.class);
	
	@RequestMapping("/addScrap.do")
	@ResponseBody
	public void addBookMark() {
		logger.info("즐겨찾기 추가");
	}
}

package com.ezen.jobsearch.scrap.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.scrap.model.ScrapService;
import com.ezen.jobsearch.scrap.model.ScrapVO;

@Controller
public class ScrapController {
	private final Logger logger
		=LoggerFactory.getLogger(ScrapController.class);
	
	@Autowired
	private ScrapService scrapService;
	
	//결과값 인코딩
	@RequestMapping(value = "/addScrap.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String addBookMark(@ModelAttribute ScrapVO scrapVo) {
		logger.info("즐겨찾기 추가, 파라미터 scrapVo={}", scrapVo);
		
		String result="로그인 해주세요";
				
		if(scrapVo.getRefMemberseq()!=0) {
			int cnt=scrapService.insertScrap(scrapVo);
			logger.info("즐겨찾기 추가 결과, cnt={}", cnt);
			result="즐겨찾기에 추가되었습니다.";
		}	
		return result;
	}
	
	@RequestMapping(value = "/delScrap.do", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String delBookMark(@ModelAttribute ScrapVO scrapVo) {
		logger.info("즐겨찾기 삭제, 파라미터 scrapVo={}", scrapVo);
		
		int cnt=scrapService.deleteScrap(scrapVo);
		logger.info("즐겨찾기 삭제 처리 cnt={}", cnt);
		
		return "즐겨찾기에서 삭제되었습니다.";
	}
}

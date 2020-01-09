package com.ezen.jobsearch.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.company.model.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	private static final Logger logger=LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	private CompanyService companyService;
	
	//기업마이페이지 - 회원정보수정
	@RequestMapping(value = "/companymypageedit.do",method = RequestMethod.GET)
	public String insertInfo_get() {
		logger.info("기업회원 정보수정창");	
		
		return "company/companymypageedit";
	}
	@RequestMapping(value="/contents.do",method = RequestMethod.GET)
	public String writeContent_get() {
		logger.info("공고작성 페이지 보여주기");
		
		return "company/contents";
	}
	
	
	
	//기업결제 관련 페이지
		@RequestMapping(value = "/companymypagepayment.do",method = RequestMethod.GET)
		public String payment() {
			logger.info("기업회원 공고글결제관련 리스트");	
			
			return "company/companymypagepayment";
		}

}

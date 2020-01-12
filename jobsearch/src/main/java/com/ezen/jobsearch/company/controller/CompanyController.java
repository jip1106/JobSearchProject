package com.ezen.jobsearch.company.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.company.model.CompanyService;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	private static final Logger logger=LoggerFactory.getLogger(CompanyController.class);
	
	
	
	@Autowired
	private CompanyService companyService;
	@Autowired
	private LocationService lService;
	@Autowired
	private CategoryService cService;
	
	//기업마이페이지 - 회원정보수정
	@RequestMapping(value = "/companymypageedit.do",method = RequestMethod.GET)
	public String insertInfo_get() {
		logger.info("기업회원 정보수정창");	
		
		return "company/companymypageedit";
	}
	@RequestMapping(value="/companymypagenotice.do",method = RequestMethod.GET)
	public String writeContent_get() {
		logger.info("공고작성 페이지 보여주기");
		
		
		return "company/companymypagenotice";
	}
	
	
	
	//기업공고등록 관련 페이지
		@RequestMapping(value = "/companymypageannouncement.do",method = RequestMethod.GET)
		public String insertAnn(Model model) {
			logger.info("기업회원 공고글등록 리스트");
			
			//1번지역 불러오기
			List<LocationVO1> list1=lService.selectLocation1();			
			List<CategoryVO1> list2=cService.selectCategory1();
			
			model.addAttribute("locationList1",list1);
			model.addAttribute("categoryList1",list2);
			
			return "company/companymypageannouncement";
		}
			
}

package com.ezen.jobsearch.company.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.company.model.CompanyService;
import com.ezen.jobsearch.emptype.model.EmpTypeService;
import com.ezen.jobsearch.emptype.model.EmpTypeVO;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;
import com.ezen.jobsearch.member.model.MemberVO;

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
	@Autowired
	private EmpTypeService eService;
	
	//기업마이페이지 - 회원정보수정
	@RequestMapping(value = "/companymypageedit.do",method = RequestMethod.GET)
	public String insertInfo_get() {
		logger.info("기업회원 정보수정창");	
		
		return "company/companymypageedit";
	}
	
	
	//기업공고등록 관련 페이지
	@RequestMapping(value = "/companymypageannouncement.do",method = RequestMethod.GET)
	public String insertAnn_get(Model model) {
		logger.info("기업회원 공고글등록 리스트");
		
		//1번지역 불러오기
		List<LocationVO1> list1=lService.selectLocation1();	
		//1번 카테고리 불러오기
		List<CategoryVO1> list2=cService.selectCategory1();
		//직종 불러오기
		List<EmpTypeVO> list3=eService.selectEmpType();
		
			logger.info("list3.size={}",list3.size());
			
		model.addAttribute("locationList1",list1);
		model.addAttribute("categoryList1",list2);
		model.addAttribute("empTypeList",list3);
		
		return "company/companymypageannouncement";
	}
	@RequestMapping(value = "/companymypageannouncement.do",method = RequestMethod.POST)
	public String insertAnn_post(@ModelAttribute AnnounceMentVO announceMentVo,HttpSession session,Model model) {
		MemberVO memberVo=(MemberVO)session.getAttribute("loginMember");
		int memSeq=memberVo.getMemberSeq();
		
		announceMentVo.setRefCompanyseq(memSeq);
		
		logger.info("기업회원 공고글 등록처리 파라미터 vo ={}",announceMentVo);
		
		int cnt=companyService.insertAnn(announceMentVo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="공고가 정상적으로 등록되었습니다.";
			url="/company/companymypageedit.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}

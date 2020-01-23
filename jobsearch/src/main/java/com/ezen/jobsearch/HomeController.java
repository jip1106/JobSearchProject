package com.ezen.jobsearch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jobsearch.ann.model.AnnounceMentVO;
import com.ezen.jobsearch.ann.model.AnnouncementService;
import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//테스트 값 지역1 불러오기
	@Autowired
	private LocationService locationService;
	
	//테스트 값 카테고리1 불러오기	
	@Autowired 
	private CategoryService categoryService;

	@Autowired
	private AnnouncementService annService;
	
	@RequestMapping(value = {"/home.do","/index.do"})
	public String home(Model model) {
		
		List<AnnounceMentVO> newAnnList = annService.selectNewAnn();
		List<AnnounceMentVO> premiumAnnList = annService.selectPremiumAnn();
		
		model.addAttribute("newAnnList", newAnnList);
		model.addAttribute("premiumAnnList", premiumAnnList);
		
		return "home";
	}
	
	@RequestMapping(value = {"/admin/home.do","/admin/index.do"})
	public String adminPage() {
		return "/admin/index";
	}
	
	@RequestMapping(value="/admin/login.do")
	public String adminLoginPage() {
		return "/admin/login/login";
	}
	
	@RequestMapping(value="/home2.do")
	public String testPage(Model model) {
		
		//지역1에대한 정보
		List<LocationVO1> locationList1 = locationService.selectLocation1();
		
		//카테고리 1에대한 정보
		List<CategoryVO1> categoryList1 = categoryService.selectCategory1();
		
		model.addAttribute("locationList1",locationList1);
		model.addAttribute("categoryList1", categoryList1);
		
		//System.out.println(categoryList1);
		
		return "locationcategoryTest";
	}
	
}

package com.ezen.jobsearch.ann.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.ann.model.AnnouncementService;
import com.ezen.jobsearch.category.model.CategoryService;
import com.ezen.jobsearch.category.model.CategoryVO1;
import com.ezen.jobsearch.category.model.CategoryVO2;
import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;

@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService annService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value = "/ann/getAnnListByLoc.do")
	public String getAnnListByLoc(String locationSeq1, String locationSeq2,String currentPage , Model model){
		
		//페이지 계산
		int pageRowCount = 6;	//한 페이지 컨텐츠 수 
		int startRow = (Integer.parseInt(currentPage)-1) * pageRowCount + 1;
		int endRow = startRow + pageRowCount - 1;
		
		//공고 리스트
		List<HashMap<String,Object>> annList = annService.getAnnListByLoc(locationSeq1, locationSeq2,startRow,endRow);
		
		
		//지역1 리스트
		List<LocationVO1> locationList1 = locationService.selectLocation1();
		
		//검색 지역
		String searchLocName = locationService.selectLocationName(locationSeq1);
		List<String> searchLocNameList = locationService.searchLocNameList(locationSeq2);
	
		//공고 검색 카운트
		int searchCount = annService.selectAnnListCount(locationSeq1,locationSeq2);
				
		int blockSize = 5;
		//페이징 셋팅
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(blockSize);
		pagingInfo.setRecordCountPerPage(pageRowCount);
		pagingInfo.setCurrentPage(Integer.parseInt(currentPage));
		pagingInfo.setTotalRecord(searchCount);
		
		//System.out.println(pagingInfo.toString());
		
		model.addAttribute("annList",annList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("searchCount",searchCount);
		model.addAttribute("searchLocNameList",searchLocNameList);
		model.addAttribute("searchLocName",searchLocName);
		model.addAttribute("locationList1", locationList1);
		
		return "/ann/locationList";		
		
	}
	
	//카테고리 선택에따른 공고 선택
	@RequestMapping("/ann/getAnnListBycate.do")
	public String getAnnListBycate(@RequestParam String cateSeq1, 
						 @RequestParam String cateSeq2, 
						 @RequestParam String cateSeq3, @RequestParam(defaultValue="1") String currentPage,
						 Model model){
			
	
		int pageRowCount = 6;	//한 페이지 컨텐츠 수 
		int startRow = (Integer.parseInt(currentPage)-1) * pageRowCount + 1;
		int endRow = startRow + pageRowCount - 1;
		
		//카테고리리스트1
		List<CategoryVO1> categoryList1 = categoryService.selectCategory1();
		model.addAttribute("categoryList1",categoryList1);
		
		//카테고리리스트2
		List<CategoryVO2> categoryList2 = categoryService.selectSubCateList(cateSeq1);
		model.addAttribute("categoryList2",categoryList2);
		
		//공고 리스트
		List<HashMap<String,Object>> annList = annService.getAnnListBycate(cateSeq1, cateSeq2,cateSeq3 , startRow, endRow);
		
		//공고 리스트 검색 카운트
		int searchCount = annService.selectAnnListCountBycate(cateSeq1, cateSeq2,cateSeq3);
		
		String searchCateName1 = categoryService.getSearchCateName1(cateSeq1);
		String searchCateName2 = categoryService.getSearchCateName2(cateSeq2);
		List<String> searchCateName3List = categoryService.getSearchCateName3List(cateSeq3);
		
		int blockSize = 5;
		//페이징 셋팅
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(blockSize);
		pagingInfo.setRecordCountPerPage(pageRowCount);
		pagingInfo.setCurrentPage(Integer.parseInt(currentPage));
		pagingInfo.setTotalRecord(searchCount);
		
						
		model.addAttribute("annList",annList);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("searchCount",searchCount);
		
		//첫번째 카테고리 이름
		model.addAttribute("searchCateName1",searchCateName1);
		//두번째 카테고리 이름
		model.addAttribute("searchCateName2",searchCateName2);
		//세번째 카테고리 리스트
		model.addAttribute("searchCateName3List",searchCateName3List);
		
		
		return "/ann/categoryList";	
		
	}
}

package com.ezen.jobsearch.ann.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jobsearch.ann.model.AnnouncementService;
import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.common.ProjectUtil;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;

@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService annService;
	
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
		
		model.addAttribute("annList",annList);
		
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
		
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("searchCount",searchCount);
		model.addAttribute("searchLocNameList",searchLocNameList);
		model.addAttribute("searchLocName",searchLocName);
		model.addAttribute("locationList1", locationList1);
		
		return "/ann/locationList";		
		
	}
}

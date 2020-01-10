package com.ezen.jobsearch.location.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;
import com.ezen.jobsearch.location.model.LocationVO2;

@Controller
public class LocationController {
	
	@Autowired
	private LocationService loactionService;
	
	@RequestMapping(value="/loc/locationList.do")
	public String locationList(Model model) {
		
		List<LocationVO1> locationList1 = loactionService.selectLocation1();
		
		//System.out.println(locationList1);
		model.addAttribute("locationList1", locationList1);
				
		
		return "/ann/locationList";
	}
	
	//지역 두번째 리스트
	@RequestMapping(value="/loc/sublocList.do")
	public @ResponseBody List<LocationVO2> selectSubLocList(Model model,@RequestParam(value="locationSeq1") String locationSeq1){
		
		List<LocationVO2> subLocationList = loactionService.selectSubLocList(locationSeq1);
		System.out.println(subLocationList);
		
		return subLocationList;
	}
}

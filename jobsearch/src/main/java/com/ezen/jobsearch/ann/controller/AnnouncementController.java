package com.ezen.jobsearch.ann.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.jobsearch.ann.model.AnnouncementService;
import com.ezen.jobsearch.location.model.LocationService;
import com.ezen.jobsearch.location.model.LocationVO1;

@Controller
public class AnnouncementController {
	
	@Autowired
	private AnnouncementService annService;
	
	@Autowired
	private LocationService locationService;
	
	@RequestMapping(value = "/ann/getAnnListByLoc.do")
	public String getAnnListByLoc(String locationSeq1, String locationSeq2,Model model){
		
			
		List<HashMap<String,Object>> annList = annService.getAnnListByLoc(locationSeq1, locationSeq2);
		
		model.addAttribute("annList",annList);
		
		List<LocationVO1> locationList1 = locationService.selectLocation1();
		model.addAttribute("locationList1", locationList1);
				
		
		return "/ann/locationList";		
		
		
	}
}

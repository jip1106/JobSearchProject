package com.ezen.jobsearch.ann.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnnounceMentController {
	
	@RequestMapping("/ann/locationlist.do")
	public String annLocationList() {
		return "/ann/locationList";
	}
	
}

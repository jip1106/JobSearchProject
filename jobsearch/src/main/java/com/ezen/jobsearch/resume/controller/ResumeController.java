package com.ezen.jobsearch.resume.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.member.model.MemberVO;

@Controller
public class ResumeController {
	private Logger logger=
		LoggerFactory.getLogger(ResumeController.class);
	
	//resume화면보여주기
	@RequestMapping(value="/resume/resume.do", method=RequestMethod.GET)
	public String resume_get(HttpSession session, Model model) throws ParseException {
		logger.info("resuem 화면보여주기");
		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String b = sdf.format(sdf.parse(memberVo.getBirthday()));
		memberVo.setBirthday(b);
		
		model.addAttribute("vo", memberVo);
		return "resume/resume";
	}
	
	//resume
	//@RequestMapping(value="/resume/resume.do", method=RequestMethod.POST)
//	public String resume_post() throws ParseException {
		
	//}
	
	
	
}

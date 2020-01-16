package com.ezen.jobsearch.resume.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.resume.model.ResumeService;

@Controller
public class ResumeController {
	private Logger logger=
		LoggerFactory.getLogger(ResumeController.class);
	
	@Autowired
	private ResumeService resumeService;
	
	//이력서 화면보여주기
	@RequestMapping(value="/resume/resume.do", method=RequestMethod.GET)
	public String resume_get(HttpSession session, Model model) throws ParseException {
		logger.info("resuem 화면보여주기");
		MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String b = sdf.format(sdf.parse(memberVo.getBirthday()));
		memberVo.setBirthday(b);
		
		List<Map<String, Object>> list=resumeService.selectEmp();
		List<Map<String, Object>> list_cate=resumeService.selectCate();
		List<Map<String, Object>> list_loca=resumeService.selectLoca();
		
		model.addAttribute("list", list);
		model.addAttribute("list_cate", list_cate);
		model.addAttribute("list_loca", list_loca);
		model.addAttribute("vo", memberVo);
		return "resume/resume";
	}
	
	@RequestMapping("/ann/annDetail.do")
	public void annD(){
		
	}
	@RequestMapping("/company/companypopup.do")
	public void cp(){
		
	}
	
	
}

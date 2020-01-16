package com.ezen.jobsearch.resume.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.member.model.MemberVO;
import com.ezen.jobsearch.resume.model.ResumeService;
import com.ezen.jobsearch.resume.model.ResumeVO;

@Controller
public class ResumeController {
	private Logger logger=
		LoggerFactory.getLogger(ResumeController.class);
	
	@Autowired
	private ResumeService resumeService;
	
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
	
	
	//인재검색
	@RequestMapping(value="/resume/searchResume.do")
	public String searchResume() {
		return "resume/searchResume";
	}
	
	//이력서등록 테스트
	@RequestMapping(value="/resume/resumeTest.do", method=RequestMethod.GET)
	public String testResumeInsert(HttpSession session, Model model) {
		
		//MemberVO memberVo=(MemberVO) session.getAttribute("loginMember");
		
		//int memberSeq = memberVo.getMemberSeq();
		int memberSeq = 8;
		
		ResumeVO resumeVo = new ResumeVO();
		resumeVo.setRefMemberseq(memberSeq);
		
		int cnt = resumeService.insertResumeTest(resumeVo);
		int resumeSeq = resumeVo.getResumeSeq();
		
		model.addAttribute("resumeSeq",resumeSeq);
		
					

		return "resume/resume2";
	}
	
	
	
	
}

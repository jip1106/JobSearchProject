package com.ezen.jobsearch.apply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.apply.model.ApplyService;
import com.ezen.jobsearch.apply.model.ApplyVO;

@Controller
public class ApplyController {
	private final Logger logger
		=LoggerFactory.getLogger(ApplyController.class);
	
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping(value = "/apply.do", method = RequestMethod.POST)
	public String insertApply(@ModelAttribute ApplyVO applyVo, Model model) {
		logger.info("지원하기, applyVo={}", applyVo);
		
		String msg="오류가 발생했습니다.", url="/ann/detail.do?annSeq="+applyVo.getRefAnnseq();
		if(applyService.selectApplyYN(applyVo)>0) {
			msg="이미 지원한 공고입니다.";
		}else {			
			int cnt=applyService.insertApply(applyVo);
			logger.info("지원 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="지원되었습니다.";
			}
		}	
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping(value = "/applyCancel.do")
	public String deleteApply(@RequestParam(defaultValue = "0") int applySeq, Model model) {
		logger.info("지원 취소, 파라미터 applySeq={}", applySeq);
		
		String msg="지원 취소 중 오류 발생", url="/member/mypageapply.do";
		if(applySeq==0) {
			msg="잘못된 url입니다.";						
		}else {		
			int cnt=applyService.deleteApply(applySeq);
			
			if(cnt>0) {
				msg="입사지원이 취소되었습니다.";
			}
		}
			
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}

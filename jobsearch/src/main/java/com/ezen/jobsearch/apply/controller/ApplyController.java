package com.ezen.jobsearch.apply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}

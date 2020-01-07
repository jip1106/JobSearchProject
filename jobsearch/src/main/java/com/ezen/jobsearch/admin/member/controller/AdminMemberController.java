package com.ezen.jobsearch.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.common.ProjectUtil;
import com.ezen.jobsearch.member.model.MemberService;
import com.ezen.jobsearch.member.model.MemberVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/admin/memberList.do")	
	public String memberList(@ModelAttribute MemberVO searchVo, Model model) {
		
		System.out.println(searchVo);
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		searchVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MemberVO> memberList = memberService.selectMemberList(searchVo);
		
		//System.out.println(memberList);
		
		int totalRecord = memberService.selectTotalRecord(searchVo);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		
		return "/admin/admin-member/memberList";
	}
	@RequestMapping(value="/admin/memberDel.do")
	public String memberList(@RequestParam(value="memberSeq") String memberSeq, @RequestParam(value="type") String type) {
		
		System.out.println("memberSeq :: " + memberSeq);
		System.out.println("type :: " + type);
		
		type=type.toUpperCase();
				
		int delCnt = memberService.deleteMember(memberSeq, type);
		
		
		
		
		return "/admin/admin-member/memberList";
	}
	
}

package com.ezen.jobsearch.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.jobsearch.board.model.BoardService;
import com.ezen.jobsearch.board.model.BoardVO;

@Controller
public class BoardController {
	private Logger logger
		=LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	//공지사항
	@RequestMapping(value = "/notice/list.do")
	public String noticeList() {
		logger.info("공지사항 목록");
		
		return "board/noticeList";
	}
	
	@RequestMapping(value = "/admin/notice/write.do", method = RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 등록 화면");
		
		return "admin/admin-board/noticeWrite";
	}
		
	//FAQ	
	@RequestMapping(value = "/faq/list.do")
	public String list() {
		logger.info("FAQ 목록");
		
		return "board/faqList";
	}
	
	@RequestMapping(value = "/admin/faq/write.do", method = RequestMethod.GET)
	public String write_get() {
		logger.info("FAQ작성 화면");
		
		return "admin/admin-board/faqWrite";
	}
	
	//공통 
	@RequestMapping(value = "/admin/board/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute BoardVO boardVo, Model model) {
		
		logger.info("게시판({}) 등록 처리 [1:공지사항 2:FAQ 3:자유게시판]", boardVo.getBoardType());
		
		int cnt=boardService.insertBoard(boardVo);
		logger.info("등록 처리 결과 cnt={}, 파라미터 boardVo={}", cnt, boardVo);
		
		String msg="등록 실패", url="/admin/notice/write.do";
		if(cnt>0) {
			if(boardVo.getBoardType().equals("1")) { //게시판 타입이 공지사항일때
				msg="공지사항이 등록되었습니다.";
				url="/notice/list.do";
			}else if(boardVo.getBoardType().equals("2")) { //게시판 타입이 FAQ일때
				msg="FAQ가 등록되었습니다.";
				url="/faq/list.do";
			}			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
}

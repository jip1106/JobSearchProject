package com.ezen.jobsearch.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.jobsearch.board.model.BoardService;
import com.ezen.jobsearch.board.model.BoardVO;

@Controller
public class BoardController {
	private Logger logger
		=LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	//사용자(공지사항, FAQ 목록)
	@RequestMapping(value = "/board/list.do")
	public String noticeList(@RequestParam String boardType, Model model) {
		logger.info("게시판({}) 목록 [1:공지사항 2:FAQ 3:자유게시판]", boardType);
		
		List<BoardVO> list=boardService.selectBoard(boardType);
		logger.info("list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		if(boardType.equals("1")) {
			return "board/noticeList";
		}else if(boardType.equals("2")) {
			return "board/faqList";
		}else {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/home.do");
			
			return "common/message";
		}
	}	
	
	//admin(등록 화면)
	@RequestMapping(value = "/admin/board/write.do", method = RequestMethod.GET)
	public String write_get(@RequestParam String boardType, Model model) {
		logger.info("게시판({}) 등록 화면 [1:공지사항 2:FAQ 3:자유게시판]", boardType);
		
		if(boardType.equals("1")) {
			return "admin/admin-board/noticeWrite";
		}else if(boardType.equals("2")) {
			return "admin/admin-board/faqWrite";
		}else {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/home.do");
			
			return "common/message";
		}
	}	
	
	//admin(공지사항, FAQ 등록처리) 
	@RequestMapping(value = "/admin/board/write.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute BoardVO boardVo, Model model) {
		
		logger.info("게시판({}) 등록 처리 [1:공지사항 2:FAQ 3:자유게시판]", boardVo.getBoardType());
		
		int cnt=boardService.insertBoard(boardVo);
		logger.info("등록 처리 결과 cnt={}, 파라미터 boardVo={}", cnt, boardVo);
		
		String msg="등록 실패", url="/admin/home.do";
		if(cnt>0) {
			if(boardVo.getBoardType().equals("1")) { //게시판 타입이 공지사항일때
				msg="공지사항이 등록되었습니다.";
				url="/admin/board/list.do?boardType=1";
			}else if(boardVo.getBoardType().equals("2")) { //게시판 타입이 FAQ일때
				msg="FAQ가 등록되었습니다.";
				url="/admin/board/list.do?boardType=2";
			}			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//admin(공지사항, FAQ 목록)
	@RequestMapping(value = "/admin/board/list.do")
	public String list(@RequestParam String boardType, Model model) {
		logger.info("admin-게시판 목록[게시판 타입 boardType={}]-  1:공지사항 2:FAQ 3:자유게시판   -", boardType);
		
		List<BoardVO>list=boardService.selectBoard(boardType);
		logger.info("list.size={},",list.size());
				
		model.addAttribute("list", list);
		
		if(boardType.equals("1")) {
			return "admin/admin-board/noticeList";
		}else if(boardType.equals("2")) {
			return "admin/admin-board/faqList";
		}else {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/home.do");
			
			return "common/message";
		}
	}
}

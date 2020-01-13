package com.ezen.jobsearch.board.controller;

import java.util.ArrayList;
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
import com.ezen.jobsearch.common.PaginationInfo;
import com.ezen.jobsearch.common.ProjectUtil;
import com.ezen.jobsearch.common.SearchVO;

@Controller
public class BoardController {
	private Logger logger
		=LoggerFactory.getLogger(BoardController.class);
	
	public static final int BOARD_RECORD=5; //사용자 게시판 레코드
	public static final int ADMIN_BOARD_RECORD=10; //관리자 게시판 레코드
	
	@Autowired
	private BoardService boardService;
	
	//사용자(공지사항, FAQ 목록)
	@RequestMapping(value = "/board/list.do")
	public String list(@RequestParam String boardType, @ModelAttribute SearchVO searchVo, Model model) {
		logger.info("게시판({}) 목록 [1:공지사항 2:FAQ 3:자유게시판]", boardType);
		logger.info("searchVo={}",searchVo);
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(BOARD_RECORD);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(BOARD_RECORD);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		if(searchVo.getSearchCondition()==null || searchVo.getSearchCondition().isEmpty()) {
			searchVo.setSearchCondition(boardType);
		}
		
		List<BoardVO> list=boardService.selectBoard(searchVo);
		logger.info("list.size={}", list.size());
		
		int totalRecord=boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
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
	
	//사용자 공지사항 상세
	@RequestMapping(value = "/board/detail.do")
	public String detail(@RequestParam String boardType, 
					@RequestParam(defaultValue = "0") int boardSeq,
					Model model) {
		logger.info("게시판({}) 상세조회 [1:공지사항 2:FAQ 3:자유게시판] boardSeq={}", boardType, boardSeq);
		
		String msg="잘못된 url입니다.", url="/home.do";
		
		BoardVO boardVo=boardService.selectByBoardSeq(boardSeq);
		if(boardVo!=null) {
			model.addAttribute("boardVo", boardVo);
			return "board/noticeDetail";
		}		
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
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
	public String adminList(@RequestParam String boardType, @ModelAttribute SearchVO searchVo, Model model) {
		logger.info("admin-게시판({}) 목록 [1:공지사항 2:FAQ 3:자유게시판]", boardType);
		logger.info("searchVo={}",searchVo);
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ADMIN_BOARD_RECORD);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(ADMIN_BOARD_RECORD);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		if(searchVo.getSearchCondition()==null || searchVo.getSearchCondition().isEmpty()) {
			searchVo.setSearchCondition(boardType);
		}
		
		List<BoardVO> list=boardService.selectBoard(searchVo);
		logger.info("list.size={}", list.size());
		
		int totalRecord=boardService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
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
	
	@RequestMapping(value = "/admin/board/edit.do", method = RequestMethod.GET)
	public String adminEdit_get(@RequestParam(defaultValue = "0") int boardSeq, Model model) {
		logger.info("게시글 수정 화면, 파라미터 boardSeq={}", boardSeq);
		
		if(boardSeq==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin/home.do");	
			
			return "common/message";
		}
		
		BoardVO boardVo=boardService.selectByBoardSeq(boardSeq);
		logger.info("게시글 boardVo={}", boardVo);
		
		model.addAttribute("boardVo", boardVo);
		
		return "admin/admin-board/edit";		
	}
	
	@RequestMapping(value = "/admin/board/edit.do", method = RequestMethod.POST)
	public String adminEdit_post(@ModelAttribute BoardVO boardVo, Model model) {
		logger.info("게시글 수정 처리, 파라미터 boardVo={}", boardVo);
		
		int cnt=boardService.updateBoard(boardVo);
		
		String msg="수정 실패", url="/admin/board/edit.do?boardSeq="+boardVo.getBoardSeq();
		
		if(cnt>0) {
			msg="수정되었습니다.";
			url="/admin/board/list.do?boardType="+boardVo.getBoardType();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/admin/board/delete.do", method = RequestMethod.POST)
	public String adminDel(@RequestParam String boardDelList, @RequestParam String boardType, Model model ) {
		logger.info("삭제할 게시글 번호={}", boardDelList);
		String[] boardSeqArr=boardDelList.split(",");
		
		List<BoardVO> list=new ArrayList<BoardVO>();
		for(int i=0;i<boardSeqArr.length;i++) {
			 list.add(boardService.selectByBoardSeq(Integer.parseInt(boardSeqArr[i])));
		}		
		logger.info("삭제할 목록 개수={}", list.size());	
		
		int cnt=boardService.deleteBoard(list);
		logger.info("선택한 상품 삭제 결과, cnt={}", cnt);
		
		String msg="", url="/admin/board/list.do?boardType="+boardType;
		if(cnt>0) {
			msg="선택한 항목들이 삭제되었습니다.";
		}else {
			msg="삭제 중 문제가 발생했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}

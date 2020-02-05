package com.ezen.jobsearch.board.model;

import java.util.List;
import java.util.Map;

import com.ezen.jobsearch.common.SearchVO;

public interface BoardService {
	int insertBoard(BoardVO boardVo);
	List<BoardVO> selectBoard(SearchVO searchVo);
	int selectTotalRecord(SearchVO searchVo);
	BoardVO selectByBoardSeq(int boardSeq);
	int updateBoard(BoardVO boardVo);
	int deleteBoard(List<BoardVO> list);
	int deleteBoard(int boardSeq);
	int updateHits(int boardSeq);
	List<BoardVO> selectMainBoard(BoardVO boardVo);
	BoardVO selectMemberName(int boardSeq);
	BoardVO selectByrowNum(int boardSeq);
}
